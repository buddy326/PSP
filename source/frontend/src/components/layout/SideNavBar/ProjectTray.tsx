import { Link } from 'react-router-dom';

import { Claims } from '@/constants/claims';
import useKeycloakWrapper from '@/hooks/useKeycloakWrapper';

import { ISideTrayPageProps } from './SideTray';
import * as Styled from './styles';

export const ProjectTray = ({ onLinkClick }: ISideTrayPageProps) => {
  const { hasClaim } = useKeycloakWrapper();
  return (
    <>
      <Styled.TrayHeader>Projects</Styled.TrayHeader>
      {hasClaim(Claims.PROJECT_VIEW) && (
        <Link onClick={onLinkClick} to="/project/list">
          Manage Projects
        </Link>
      )}
      {hasClaim(Claims.PROJECT_ADD) && (
        <Link onClick={onLinkClick} to="/mapview/sidebar/project/new">
          Create Project
        </Link>
      )}
    </>
  );
};
