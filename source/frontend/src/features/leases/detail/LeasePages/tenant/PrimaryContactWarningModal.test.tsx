import { createMemoryHistory } from 'history';
import { noop } from 'lodash';

import { LeaseFormModel } from '@/features/leases/models';
import { mockApiPerson, mockOrganization } from '@/mocks/filterData.mock';
import { getMockApiLease } from '@/mocks/lease.mock';
import { defaultApiLease } from '@/models/api/Lease';
import { render, RenderOptions, screen, userEvent } from '@/utils/test-utils';

import { FormTenant } from './models';
import PrimaryContactWarningModal from './PrimaryContactWarningModal';

const history = createMemoryHistory();

describe('PrimaryContactWarningModal component', () => {
  const setup = (
    renderOptions: RenderOptions & { tenants?: FormTenant[]; saveCallback?: Function } = {},
  ) => {
    // render component under test
    const component = render(
      <PrimaryContactWarningModal
        selectedTenants={renderOptions.tenants ?? []}
        saveCallback={renderOptions.saveCallback}
      />,
      {
        ...renderOptions,
        history,
      },
    );

    return {
      component,
    };
  };
  it('renders as expected', () => {
    const { component } = setup({
      tenants: LeaseFormModel.fromApi({
        ...defaultApiLease,
        tenants: [
          { leaseId: 1, person: mockApiPerson },
          { leaseId: 1, organization: mockOrganization },
        ],
      }).tenants,
    });
    expect(component.asFragment()).toMatchSnapshot();
  });
  it('calls saveCallback on save', () => {
    const saveCallback = jest.fn();
    const { component } = setup({
      saveCallback: saveCallback,
      tenants: LeaseFormModel.fromApi({
        ...defaultApiLease,
        tenants: [
          { leaseId: 1, person: mockApiPerson },
          { leaseId: 1, person: mockApiPerson },
        ],
      }).tenants,
    });
    const { getByText } = component;
    const save = getByText('Save');
    userEvent.click(save);

    expect(saveCallback).toHaveBeenCalled();
  });

  it('displays all organization tenants that have multiple persons and no primary contact', () => {
    setup({
      tenants: LeaseFormModel.fromApi({
        ...getMockApiLease(),
        tenants: [
          {
            ...getMockApiLease().tenants[0],
            primaryContactId: undefined,
            primaryContact: undefined,
          },
        ],
      }).tenants,
      saveCallback: noop,
    });
    const tenantText = screen.getByText(content =>
      content.includes('French Mouse Property Management'),
    );

    expect(tenantText).toBeVisible();
  });
});
