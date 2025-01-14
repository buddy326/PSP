import { Formik } from 'formik';
import { noop } from 'lodash';

import { Claims } from '@/constants/claims';
import { getMockActivityResponse } from '@/mocks/activities.mock';
import { mockLookups } from '@/mocks/index.mock';
import { lookupCodesSlice } from '@/store/slices/lookupCodes';
import { render, RenderOptions, userEvent } from '@/utils/test-utils';

import { ActivityControlsBar, IActivityControlsBarProps } from './ActivityControlsBar';

const storeState = {
  [lookupCodesSlice.name]: { lookupCodes: mockLookups },
};

jest.mock('@react-keycloak/web');
const onEditRelatedProperties = jest.fn();

describe('ActivityControlsBar test', () => {
  const setup = (renderOptions: RenderOptions & IActivityControlsBarProps) => {
    // render component under test
    const component = render(
      <Formik onSubmit={noop} initialValues={getMockActivityResponse()}>
        <ActivityControlsBar
          editMode={renderOptions.editMode}
          onEditRelatedProperties={renderOptions.onEditRelatedProperties}
        />
      </Formik>,
      {
        ...renderOptions,
        store: storeState,
        claims: renderOptions.claims ?? [Claims.ACTIVITY_EDIT, Claims.PROPERTY_EDIT],
      },
    );

    return {
      ...component,
    };
  };

  beforeEach(() => {
    jest.restoreAllMocks();
  });

  it('Renders as expected', async () => {
    const { asFragment } = setup({ editMode: false, onEditRelatedProperties });
    expect(asFragment()).toMatchSnapshot();
  });

  it('hides the edit button when in edit mode', async () => {
    const { queryByTitle } = setup({ editMode: true, onEditRelatedProperties });
    expect(queryByTitle('edit')).toBeNull();
  });

  it('hides the edit button when user does not have edit activity claim', async () => {
    const { queryByTitle } = setup({
      editMode: true,
      claims: [],
      onEditRelatedProperties,
    });
    expect(queryByTitle('edit')).toBeNull();
  });

  it('hides the Related Properties button when user does not have correct claims', async () => {
    const { queryByText } = setup({
      editMode: true,
      claims: [],
      onEditRelatedProperties,
    });
    expect(queryByText('Related properties')).toBeNull();
  });

  it('renders the activity status select', async () => {
    const { queryByLabelText } = setup({
      editMode: false,
      claims: [],
      onEditRelatedProperties,
    });
    expect(queryByLabelText('Status')).toBeNull();
  });

  it('populates status field as expected', async () => {
    const { getByRole } = setup({
      editMode: true,
      onEditRelatedProperties,
    });
    expect((getByRole('option', { name: 'In Progress' }) as any).selected).toBe(true);
  });

  it('calls expected function when related properties is clicked', async () => {
    const { getByText } = setup({
      editMode: true,
      onEditRelatedProperties,
    });
    const relatedPropertiesButton = getByText('Related properties');
    userEvent.click(relatedPropertiesButton);
    expect(onEditRelatedProperties).toHaveBeenCalled();
  });
});
