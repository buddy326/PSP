import { createMemoryHistory } from 'history';
import noop from 'lodash/noop';

import { LeaseContextProvider } from '@/features/leases/context/LeaseContext';
import { usePropertyLeaseRepository } from '@/hooks/repositories/usePropertyLeaseRepository';
import { getMockApiProperty } from '@/mocks/properties.mock';
import { Api_Lease, defaultApiLease } from '@/models/api/Lease';
import { Api_Property } from '@/models/api/Property';
import { prettyFormatDate } from '@/utils';
import { render, RenderOptions, RenderResult, waitFor } from '@/utils/test-utils';

import Surplus from './Surplus';

const history = createMemoryHistory();

usePropertyLeaseRepository as jest.MockedFunction<typeof usePropertyLeaseRepository>;
jest.mock('@/hooks/repositories/usePropertyLeaseRepository');

describe('Lease Surplus Declaration', () => {
  const setup = (renderOptions: RenderOptions & { lease?: Api_Lease } = {}): RenderResult => {
    // render component under test
    const result = render(
      <LeaseContextProvider initialLease={renderOptions.lease ?? defaultApiLease}>
        <Surplus />
      </LeaseContextProvider>,
      {
        ...renderOptions,
        history,
      },
    );
    return result;
  };

  it('renders as expected', () => {
    (
      usePropertyLeaseRepository as jest.MockedFunction<typeof usePropertyLeaseRepository>
    ).mockReturnValue({
      getPropertyLeases: {
        execute: noop as any,
        error: undefined,
        loading: false,
        response: [],
      },
    });
    const result = setup({
      lease: {
        ...defaultApiLease,
      },
    });
    expect(result.asFragment()).toMatchSnapshot();
  });

  it('Table row count is equal to the number of properties + header', async () => {
    (
      usePropertyLeaseRepository as jest.MockedFunction<typeof usePropertyLeaseRepository>
    ).mockReturnValue({
      getPropertyLeases: {
        execute: noop as any,
        error: undefined,
        loading: false,
        response: [
          {
            property: getMockApiProperty(),
            lease: null,
            leaseId: 0,
            leaseArea: null,
            areaUnitType: null,
          },
        ],
      },
    });
    const result = setup();
    await waitFor(async () => {
      const rows = result.getAllByRole('row');

      expect(rows.length).toBe(2);
    });
  });

  it('Default type value is unknown', async () => {
    const testProperty: Api_Property = getMockApiProperty();
    testProperty.surplusDeclarationType = undefined;
    (
      usePropertyLeaseRepository as jest.MockedFunction<typeof usePropertyLeaseRepository>
    ).mockReturnValue({
      getPropertyLeases: {
        execute: noop as any,
        error: undefined,
        loading: false,
        response: [
          { property: testProperty, lease: null, leaseId: 0, leaseArea: null, areaUnitType: null },
        ],
      },
    });
    const result = setup();
    await waitFor(async () => {
      const dataRow = result.getAllByRole('row')[1];
      const columns = dataRow.querySelectorAll('[role="cell"]');

      expect(columns[1].textContent).toBe('Unknown');
    });
  });

  it('Values are displayed', async () => {
    const testProperty: Api_Property = { ...getMockApiProperty(), pid: 1 };
    testProperty.surplusDeclarationComment = 'Test Comment';
    testProperty.surplusDeclarationType = { id: 'YES', isDisabled: false, description: 'Yes' };
    testProperty.surplusDeclarationDate = '2021-01-01';
    (
      usePropertyLeaseRepository as jest.MockedFunction<typeof usePropertyLeaseRepository>
    ).mockReturnValue({
      getPropertyLeases: {
        execute: noop as any,
        error: undefined,
        loading: false,
        response: [
          { property: testProperty, lease: null, leaseId: 0, leaseArea: null, areaUnitType: null },
        ],
      },
    });

    const result = setup();

    await waitFor(async () => {
      const dataRow = result.getAllByRole('row')[1];
      const columns = dataRow.querySelectorAll('[role="cell"]');

      expect(columns[0].textContent).toBe('000-000-001');
      expect(columns[1].textContent).toBe(testProperty.surplusDeclarationType?.description);
      expect(columns[2].textContent).toBe(prettyFormatDate(testProperty.surplusDeclarationDate));
      expect(columns[3].textContent).toBe(testProperty.surplusDeclarationComment);
    });
  });
});
