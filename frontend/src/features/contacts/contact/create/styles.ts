import { Form as FormBase } from 'components/common/form';
import { Form as FormikForm } from 'formik';
import styled from 'styled-components';

// common ui styling
export * from 'features/contacts/styles';

export const H2 = styled.h2`
  font-size: 2rem;
  font-weight: 700;
  color: ${props => props.theme.css.primaryColor};
  text-decoration: none solid rgb(0, 51, 102);
  line-height: 2.9rem;
`;

export const H3 = styled.h3`
  font-size: 1.6rem;
  font-weight: 700;
  color: ${props => props.theme.css.formTextColor};
  text-decoration: none solid rgb(33, 37, 41);
  line-height: 2rem;
`;

// TODO: This is common form look-and-feel. Should be abstracted for all forms
export const Form = styled(FormikForm)`
  &#createForm {
    .form-control {
      &.is-invalid {
        border: 2px solid #d8292f;
      }
    }

    .invalid-feedback {
      color: #d8292f;
    }

    .form-group {
      label {
        font-size: 1.6rem;
        font-weight: 700;
        color: ${props => props.theme.css.formTextColor};
        text-decoration: none solid rgb(33, 37, 41);
        line-height: 2rem;
      }

      input,
      select,
      textarea {
        border: 2px solid #606060;
        border-radius: 4px;
        background-color: #ffffff;
        font-size: 1.6rem;
        color: #000000;
        text-decoration: none;
      }

      &.required {
        label:after {
          content: ' *';
          color: red;
        }
      }
    }
  }
`;

export const FormLabel = styled(FormBase.Label)`
  font-size: 1.6rem;
  font-weight: 700;
  color: ${props => props.theme.css.formTextColor};
  text-decoration: none solid rgb(33, 37, 41);
  line-height: 2rem;
`;

export const SubtleText = styled.span`
  font-size: 1.6rem;
  font-weight: 400;
  color: ${props => props.theme.css.subtleColor};
  text-decoration: none solid rgb(170, 170, 170);
  line-height: 2rem;
`;

export const PadBox = styled.div`
  padding: 1rem 4rem;
`;