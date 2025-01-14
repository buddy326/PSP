import * as React from 'react';

import Claims from '@/constants/claims';
import { DocumentRelationshipType } from '@/constants/documentRelationshipType';
import DocumentListContainer from '@/features/documents/list/DocumentListContainer';
import useKeycloakWrapper from '@/hooks/useKeycloakWrapper';

interface IResearchDocumentsTabProps {
  researchFileId: number;
}

const ResearchDocumentsTab: React.FunctionComponent<IResearchDocumentsTabProps> = ({
  researchFileId,
}) => {
  const { hasClaim } = useKeycloakWrapper();

  return (
    <>
      <DocumentListContainer
        title="File Documents"
        parentId={researchFileId.toString()}
        relationshipType={DocumentRelationshipType.RESEARCH_FILES}
      />
      {hasClaim(Claims.ACTIVITY_VIEW) && (
        <DocumentListContainer
          title="Activity Documents"
          parentId={researchFileId.toString()}
          relationshipType={DocumentRelationshipType.RESEARCH_FILE_ACTIVITIES}
          disableAdd
        />
      )}
    </>
  );
};

export default ResearchDocumentsTab;
