import { PARCELS_LAYER_URL, useLayerQuery } from 'components/maps/leaflet/LayerPopup';
import { FeatureCollection, GeoJsonProperties, Geometry, Polygon } from 'geojson';
import { useApiGeocoder } from 'hooks/pims-api/useApiGeocoder';
import { IGeocoderResponse } from 'hooks/useApi';
import debounce from 'lodash/debounce';
import isNumber from 'lodash/isNumber';
import noop from 'lodash/noop';
import polylabel from 'polylabel';
import * as React from 'react';
import { useState } from 'react';
import { toast } from 'react-toastify';

import { MapClickMonitor } from '../components/MapClickMonitor';
import { ILayerSearchCriteria, IMapProperty } from '../models';
import { getPropertyIdentifier } from '../utils';
import PropertySearchSelectorFormView from './PropertySearchSelectorFormView';

export interface IPropertySelectorSearchContainerProps {
  selectedProperties: IMapProperty[];
  setSelectedProperties: (properties: IMapProperty[]) => void;
}

export const PropertySelectorSearchContainer: React.FunctionComponent<IPropertySelectorSearchContainerProps> = ({
  selectedProperties,
  setSelectedProperties,
}) => {
  const [layerSearch, setLayerSearch] = useState<ILayerSearchCriteria | undefined>();
  const [searchResults, setSearchResults] = useState<IMapProperty[]>([]);
  const [addressResults, setAddressResults] = useState<IGeocoderResponse[]>([]);

  const { getSitePids, searchAddress } = useApiGeocoder();

  const {
    findByPid,
    findByPin,
    findByPlanNumber,
    findByPidLoading,
    findByPinLoading,
    findByPlanNumberLoading,
  } = useLayerQuery(PARCELS_LAYER_URL);

  React.useEffect(() => {
    const searchFunc = async () => {
      let result: FeatureCollection<Geometry, GeoJsonProperties> | undefined = undefined;
      if (layerSearch?.searchBy === 'pid' && layerSearch.pid) {
        result = await findByPid(layerSearch.pid, true);
      } else if (
        layerSearch?.searchBy === 'pin' &&
        layerSearch.pin &&
        isNumber(+layerSearch?.pin)
      ) {
        result = await findByPin(layerSearch.pin, true);
      } else if (layerSearch?.searchBy === 'planNumber' && layerSearch.planNumber) {
        result = await findByPlanNumber(layerSearch.planNumber, true);
      }
      setSearchResults(featuresToIdentifiedMapProperty(result) ?? []);
    };
    searchFunc();
  }, [findByPid, findByPin, findByPlanNumber, layerSearch]);

  const handleOnAddressSelect = async (selectedItem: IGeocoderResponse) => {
    if (!selectedItem.siteId) {
      toast.info('No site id found for selected address');
      return;
    }
    const pidResults = await getSitePids(selectedItem.siteId);

    if (pidResults && pidResults.data?.pids) {
      if (pidResults.data.pids.length > 50) {
        toast.error('Maximum PID search size exceeded for selected address');
        return;
      }

      const findByPidCalls: Promise<
        FeatureCollection<Geometry, GeoJsonProperties> | undefined
      >[] = [];
      pidResults.data.pids.forEach(async (pid: string) => {
        findByPidCalls.push(findByPid(pid, true));
      });
      Promise.all(findByPidCalls).then(
        (response: (FeatureCollection<Geometry, GeoJsonProperties> | undefined)[]) => {
          let propertyResults: IMapProperty[] = [];
          response?.forEach((item: FeatureCollection<Geometry, GeoJsonProperties> | undefined) => {
            if (item) {
              propertyResults = propertyResults.concat(featuresToIdentifiedMapProperty(item) ?? []);
            }
          });
          setSearchResults([...propertyResults]);
          setAddressResults([]);
        },
      );
    }
  };

  const debouncedSearch = React.useRef(
    debounce(
      async (val: string, abort: boolean) => {
        if (!abort) {
          const addresses = await searchAddress(
            val,
            `matchPrecisionNot=OCCUPANT,INTERSECTION,BLOCK,STREET,LOCALITY,PROVINCE,OCCUPANT`,
          );
          setAddressResults(addresses.data);
        }
      },
      500,
      { trailing: true },
    ),
  ).current;

  const handleOnAddressChange = async (val?: string) => {
    if (val && val.length >= 5) {
      debouncedSearch(val, false);
    } else {
      setAddressResults([]);
    }
  };

  return (
    <>
      <PropertySearchSelectorFormView
        onSearch={setLayerSearch}
        selectedProperties={selectedProperties}
        search={layerSearch}
        searchResults={searchResults}
        loading={findByPidLoading || findByPinLoading || findByPlanNumberLoading}
        onSelectedProperties={setSelectedProperties}
        addressResults={addressResults}
        onAddressChange={handleOnAddressChange}
        onAddressSelect={handleOnAddressSelect}
      />

      <MapClickMonitor addProperty={noop} />
    </>
  );
};
export const featuresToIdentifiedMapProperty = (
  values: FeatureCollection<Geometry, GeoJsonProperties> | undefined,
) =>
  values?.features
    ?.filter(feature => feature?.geometry?.type === 'Polygon')
    .map(
      (feature): IMapProperty => {
        const boundedCenter = polylabel((feature.geometry as Polygon).coordinates);
        const property: IMapProperty = {
          pid: feature?.properties?.PID?.toString() ?? '',
          pin: feature?.properties?.PIN?.toString() ?? '',
          planNumber: feature?.properties?.PLAN_NUMBER?.toString() ?? '',
          latitude: boundedCenter[1],
          longitude: boundedCenter[0],
        };
        property.id = getPropertyIdentifier(property);
        return property;
      },
    );

export default PropertySelectorSearchContainer;