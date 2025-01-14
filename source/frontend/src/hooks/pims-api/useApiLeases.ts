import queryString from 'query-string';
import React from 'react';

import { ILeaseFilter } from '@/features/leases';
import { ILeaseSearchResult, IPagedItems } from '@/interfaces';
import { Api_Lease } from '@/models/api/Lease';
import { UserOverrideCode } from '@/models/api/UserOverrideCode';

import { IPaginateRequest } from './interfaces/IPaginateRequest';
import useAxiosApi from './useApi';

/**
 * PIMS API wrapper to centralize all AJAX requests to the lease endpoints.
 * @returns Object containing functions to make requests to the PIMS API.
 */
export const useApiLeases = () => {
  const api = useAxiosApi();

  return React.useMemo(
    () => ({
      getLeases: (params: IPaginateLeases | null) =>
        api.get<IPagedItems<ILeaseSearchResult>>(
          `/leases/search?${params ? queryString.stringify(params) : ''}`,
        ),
      getApiLease: (id: number) => api.get<Api_Lease>(`/leases/${id}`),
      postLease: (lease: Api_Lease, userOverrideCodes: UserOverrideCode[]) =>
        api.post<Api_Lease>(
          `/leases?${userOverrideCodes.map(o => `userOverrideCodes=${o}`).join('&')}`,
          lease,
        ),
      putApiLease: (lease: Api_Lease, userOverrideCodes: UserOverrideCode[] = []) =>
        api.put<Api_Lease>(
          `/leases/${lease.id}?${userOverrideCodes.map(o => `userOverrideCodes=${o}`).join('&')}`,
          lease,
        ),
      exportLeases: (filter: IPaginateLeases, outputFormat: 'csv' | 'excel' = 'excel') =>
        api.get<Blob>(
          `/reports/leases?${filter ? queryString.stringify({ ...filter, all: true }) : ''}`,
          {
            responseType: 'blob',
            headers: {
              Accept: outputFormat === 'csv' ? 'text/csv' : 'application/vnd.ms-excel',
            },
          },
        ),
      exportAggregatedLeases: (fiscalYearStart: number) =>
        api.get<Blob>(`/reports/leases/aggregated?fiscalYearStart=${fiscalYearStart}`, {
          responseType: 'blob',
          headers: {
            Accept: 'application/vnd.ms-excel',
          },
        }),
      exportLeasePayments: (fiscalYearStart: number) =>
        api.get<Blob>(`/reports/leases/payments?fiscalYearStart=${fiscalYearStart}`, {
          responseType: 'blob',
          headers: {
            Accept: 'application/vnd.ms-excel',
          },
        }),
    }),
    [api],
  );
};

export type IPaginateLeases = IPaginateRequest<ILeaseFilter>;
