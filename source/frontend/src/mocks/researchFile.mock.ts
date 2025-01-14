import { Api_ResearchFile } from '@/models/api/ResearchFile';
export const getMockResearchFile = (): Api_ResearchFile => ({
  id: 109,
  fileName: 'fsdgsdf',
  fileNumber: 'R-109',
  roadName: 'Test road name',
  roadAlias: 'Test road alias',
  fileStatusTypeCode: {
    id: 'ACTIVE',
    description: 'Active',
    isDisabled: false,
  },
  fileProperties: [
    {
      id: 55,
      isDisabled: false,
      propertyId: 495,
      property: {
        id: 495,
        anomalies: [],
        tenures: [],
        roadTypes: [],
        adjacentLands: [],
        region: {
          id: 1,
          description: 'South Coast Region',
          isDisabled: false,
        },
        district: {
          id: 1,
          description: 'Lower Mainland District',
          isDisabled: false,
        },
        dataSourceEffectiveDate: '2022-09-02T00:00:00',
        latitude: 49.27720127104871,
        longitude: -123.128633565,
        isSensitive: false,
        isRwyBeltDomPatent: false,
        pin: 0,
        pid: 123456789,
        planNumber: 'EPP92028',
        landArea: 0,
        isVolumetricParcel: false,
        location: {
          coordinate: {
            x: -123.128633565,
            y: 49.27720127104871,
          },
        },
        rowVersion: 1,
      },
      rowVersion: 1,
    },
  ],
  requestDate: '2022-04-14T00:00:00',
  requestDescription: 'a request description',
  researchResult: 'A research result',
  researchCompletionDate: '2022-03-30T00:00:00',
  isExpropriation: false,
  expropriationNotes: 'An expropriation note',
  requestSourceType: {
    id: 'HQ',
    description: 'Headquarters (HQ)',
    isDisabled: false,
  },
  requestorOrganization: {
    id: 3,
    isDisabled: false,
    name: 'Dairy Queen Forever! Property Management',
    organizationPersons: [],
    organizationAddresses: [],
    contactMethods: [],
    rowVersion: 1,
  },
  researchFilePurposes: [],
  researchFileProjects: [
    {
      id: 1,
      isDisabled: false,
      project: {
        id: 1,
        code: '00048',
        description: 'CLAIMS',
        businessFunctionCode: null,
        costTypeCode: null,
        projectStatusTypeCode: null,
        regionCode: null,
        workActivityCode: null,
        note: null,
        products: [],
        appCreateTimestamp: '2023-01-30T21:33:33.063',
        appLastUpdateTimestamp: '2023-01-30T21:33:33.063',
        appLastUpdateUserid: 'dbo',
        appCreateUserid: 'dbo',
        rowVersion: 1,
      },
      projectId: 1,
      fileId: 109,
      rowVersion: 1,
    },
  ],
  appCreateTimestamp: '2022-09-02T19:29:50.397',
  appLastUpdateTimestamp: '2022-09-02T19:29:50.397',
  appLastUpdateUserid: 'admin',
  appCreateUserid: 'admin',
  appLastUpdateUserGuid: '14c9a273-6f4a-4859-8d59-9264d3cee53f',
  appCreateUserGuid: '14c9a273-6f4a-4859-8d59-9264d3cee53f',
  rowVersion: 1,
});
