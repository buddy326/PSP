import axios, { AxiosError } from 'axios';
import { usePropertyDetails } from 'features/mapSideBar/hooks/usePropertyDetails';
import {
  IInventoryTabsProps,
  InventoryTabNames,
  TabInventoryView,
} from 'features/mapSideBar/tabs/InventoryTabs';
import LtsaTabView from 'features/mapSideBar/tabs/ltsa/LtsaTabView';
import PropertyAssociationTabView from 'features/mapSideBar/tabs/propertyAssociations/PropertyAssociationTabView';
import { PropertyDetailsTabView } from 'features/mapSideBar/tabs/propertyDetails/detail/PropertyDetailsTabView';
import useIsMounted from 'hooks/useIsMounted';
import { useLtsa } from 'hooks/useLtsa';
import { useProperties } from 'hooks/useProperties';
import { usePropertyAssociations } from 'hooks/usePropertyAssociations';
import { IApiError } from 'interfaces/IApiError';
import { IPropertyApiModel } from 'interfaces/IPropertyApiModel';
import { LtsaOrders } from 'interfaces/ltsaModels';
import { Api_PropertyAssociations } from 'models/api/Property';
import { Api_PropertyFile } from 'models/api/PropertyFile';
import * as React from 'react';
import { useEffect, useState } from 'react';
import { pidFormatter } from 'utils';

export interface IPropertyFileContainerProps {
  fileProperty: Api_PropertyFile;
  setEditFileProperty: () => void;
  View: React.FunctionComponent<IInventoryTabsProps>;
  customTabs: TabInventoryView[];
  defaultTab: InventoryTabNames;
}

export const PropertyFileContainer: React.FunctionComponent<IPropertyFileContainerProps> = props => {
  const isMounted = useIsMounted();
  const [ltsaData, setLtsaData] = useState<LtsaOrders | undefined>(undefined);
  const [apiProperty, setApiProperty] = useState<IPropertyApiModel | undefined>(undefined);
  const [ltsaDataRequestedOn, setLtsaDataRequestedOn] = useState<Date | undefined>(undefined);
  const [propertyAssociations, setPropertyAssociations] = useState<
    Api_PropertyAssociations | undefined
  >(undefined);
  const [showPropertyInfoTab, setShowPropertyInfoTab] = useState(true);

  const pid = props.fileProperty?.property?.pid?.toString();
  const id = props.fileProperty?.property?.id;

  // First, fetch property information from PSP API
  const { getProperty, getPropertyLoading: propertyLoading } = useProperties();
  useEffect(() => {
    const func = async () => {
      try {
        if (!!id) {
          const propInfo = await getProperty(id);
          if (isMounted() && propInfo?.id === id) {
            setApiProperty(propInfo);
            setShowPropertyInfoTab(true);
          }
        }
      } catch (e) {
        // PSP-2919 Hide the property info tab for non-inventory properties
        // We get an error because PID is not on our database
        if (axios.isAxiosError(e)) {
          const axiosError = e as AxiosError<IApiError>;
          if (axiosError?.response?.status === 404) {
            setShowPropertyInfoTab(false);
          }
        }
      }
    };
    func();
  }, [getProperty, id, isMounted]);

  // After API property object has been received, we query relevant map layers to find
  // additional information which we store in a different model (IPropertyDetailsForm)
  const propertyViewForm = usePropertyDetails(apiProperty);

  const { getLtsaData, ltsaLoading } = useLtsa();
  useEffect(() => {
    const func = async () => {
      setLtsaDataRequestedOn(new Date());
      setLtsaData(undefined);
      if (!!pid) {
        const ltsaData = await getLtsaData(pidFormatter(pid));
        if (
          isMounted() &&
          ltsaData?.parcelInfo?.orderedProduct?.fieldedData.parcelIdentifier === pidFormatter(pid)
        ) {
          setLtsaData(ltsaData);
        }
      }
    };
    func();
  }, [getLtsaData, pid, isMounted]);

  const {
    getPropertyAssociations,
    isLoading: propertyAssociationsLoading,
  } = usePropertyAssociations();

  useEffect(() => {
    const func = async () => {
      if (id !== undefined) {
        const response = await getPropertyAssociations(id);
        if (response?.id !== undefined) {
          setPropertyAssociations(response);
        }
      }
    };
    func();
  }, [getPropertyAssociations, id]);

  const tabViews: TabInventoryView[] = [];

  tabViews.push({
    content: (
      <LtsaTabView
        ltsaData={ltsaData}
        ltsaRequestedOn={ltsaDataRequestedOn}
        loading={ltsaLoading}
        pid={apiProperty?.pid}
      />
    ),
    key: InventoryTabNames.title,
    name: 'Title',
  });
  tabViews.push({
    content: <></>,
    key: InventoryTabNames.value,
    name: 'Value',
  });

  tabViews.push(...props.customTabs);

  if (showPropertyInfoTab) {
    tabViews.push({
      content: (
        <PropertyDetailsTabView
          property={propertyViewForm}
          loading={propertyLoading}
          setEditMode={editable => {
            props.setEditFileProperty();
          }}
        />
      ),
      key: InventoryTabNames.property,
      name: 'Property Details',
    });
  }

  if (propertyAssociations?.id !== undefined) {
    tabViews.push({
      content: (
        <PropertyAssociationTabView
          isLoading={propertyAssociationsLoading}
          associations={propertyAssociations}
        />
      ),
      key: InventoryTabNames.pims,
      name: 'PIMS Files',
    });
  }

  const [activeTab, setActiveTab] = useState<InventoryTabNames>(props.defaultTab);
  const InventoryTabsView = props.View;

  return (
    <InventoryTabsView
      loading={propertyAssociationsLoading || ltsaLoading || propertyLoading}
      tabViews={tabViews}
      defaultTabKey={props.defaultTab}
      activeTab={activeTab}
      setActiveTab={setActiveTab}
    />
  );
};

export default PropertyFileContainer;