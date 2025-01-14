/****** DELETE AUTOMATION TESTING DATA  ******/
--CONTACTS
DELETE FROM PIMS_CONTACT_METHOD WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_CONTACT_METHOD  WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_LEASE_TENANT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_PERSON_ADDRESS WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_PERSON_ORGANIZATION WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
SELECT * FROM PIMS_ACQUISITION_PAYEE WHERE ACQUISITION_FILE_PERSON_ID IN (SELECT ACQUISITION_FILE_PERSON_ID FROM PIMS_ACQUISITION_FILE_PERSON WHERE PERSON_ID IN (SELECT PERSON_ID FROM PIMS_PERSON WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')))
DELETE FROM PIMS_ACQUISITION_FILE_PERSON WHERE PERSON_ID IN (SELECT PERSON_ID FROM PIMS_PERSON WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PERSON_ADDRESS WHERE PERSON_ID IN (SELECT PERSON_ID FROM PIMS_PERSON WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PERSON WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA') AND PIMS_PERSON.PERSON_ID NOT IN (SELECT PERSON_ID FROM PIMS_USER);

-- ORGANIZATION
DELETE FROM PIMS_ORGANIZATION_ADDRESS WHERE ORGANIZATION_ID IN (SELECT ORGANIZATION_ID FROM PIMS_ORGANIZATION WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ORGANIZATION WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');

-- PROJECTS
DELETE FROM PIMS_SECURITY_DEPOSIT_RETURN_HOLDER WHERE SECURITY_DEPOSIT_RETURN_ID IN (SELECT SECURITY_DEPOSIT_RETURN_ID FROM PIMS_SECURITY_DEPOSIT_RETURN WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')))));
DELETE FROM PIMS_SECURITY_DEPOSIT_RETURN WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_SECURITY_DEPOSIT_HOLDER WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_LEASE_NOTE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_PROPERTY_LEASE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_PROPERTY_IMPROVEMENT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_LEASE_TENANT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_LEASE_PAYMENT WHERE LEASE_TERM_ID IN (SELECT LEASE_TERM_ID FROM PIMS_LEASE_TERM WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_LEASE_TERM WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_INSURANCE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_LEASE_CONSULTATION WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_LEASE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_FILE_NOTE WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PIMS_PRODUCT WHERE PARENT_PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_ACQUISITION_FILE WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PIMS_PRODUCT WHERE PARENT_PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_PRODUCT WHERE PARENT_PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_FILE_PROJECT WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_FILE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PROJECT_NOTE WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PROJECT_DOCUMENT WHERE PROJECT_ID IN (SELECT ID FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PROJECT WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');

-- LEASES
DELETE FROM PIMS_PROPERTY_LEASE WHERE LEASE_ID IN (SELECT LEASE_ID WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_INSURANCE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_PAYMENT WHERE LEASE_TERM_ID IN (SELECT LEASE_TERM_ID FROM PIMS_LEASE_TERM WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')))
DELETE FROM PIMS_LEASE_TERM WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PROPERTY_IMPROVEMENT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_SECURITY_DEPOSIT_HOLDER WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_SECURITY_DEPOSIT_RETURN_HOLDER WHERE SECURITY_DEPOSIT_RETURN_ID IN (SELECT SECURITY_DEPOSIT_RETURN_ID FROM PIMS_SECURITY_DEPOSIT_RETURN WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_SECURITY_DEPOSIT_RETURN WHERE SECURITY_DEPOSIT_ID IN (SELECT SECURITY_DEPOSIT_ID FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_SECURITY_DEPOSIT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_ACTIVITY_INSTANCE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_NOTE WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_CONSULTATION WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_DOCUMENT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE_TENANT WHERE LEASE_ID IN (SELECT LEASE_ID FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_LEASE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');

-- FINANCIAL CODES
DELETE FROM PIMS_WORK_ACTIVITY_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_BUSINESS_FUNCTION_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_CHART_OF_ACCOUNTS_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_FINANCIAL_ACTIVITY_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_RESPONSIBILITY_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
UPDATE PIMS_COMPENSATION_REQUISITION SET YEARLY_FINANCIAL_ID = 221, CONCURRENCY_CONTROL_NUMBER = CONCURRENCY_CONTROL_NUMBER +1 WHERE YEARLY_FINANCIAL_ID IN (SELECT YEARLY_FINANCIAL_ID FROM PIMS_YEARLY_FINANCIAL_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_YEARLY_FINANCIAL_CODE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');

-- ACQUISITION FILES
DELETE FROM PIMS_ACQUISITION_FILE_NOTE WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_FILE_DOCUMENT WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACT_INST_PROP_ACQ_FILE WHERE PROPERTY_ACQUISITION_FILE_ID IN (SELECT PROPERTY_ACQUISITION_FILE_ID FROM PIMS_PROPERTY_ACQUISITION_FILE WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_ACQUISITION_CHECKLIST_ITEM WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_COMP_REQ_H120 WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_OWNER_SOLICITOR WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_AGREEMENT WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQ_PAYEE_CHEQUE WHERE ACQUISITION_PAYEE_ID IN (SELECT ACQUISITION_PAYEE_ID FROM PIMS_ACQUISITION_PAYEE WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))));
DELETE FROM PIMS_ACQUISITION_PAYEE WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')));
DELETE FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_CHECKLIST_ITEM WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_ACQUISITION_FILE_NOTE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
DELETE FROM PIMS_ACQUISITION_OWNER_REP WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'))
DELETE FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');

DELETE FROM PIMS_ACQUISITION_FILE_NOTE WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACQUISITION_FILE_DOCUMENT WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACT_INST_PROP_ACQ_FILE WHERE PROPERTY_ACQUISITION_FILE_ID IN (SELECT PROPERTY_ACQUISITION_FILE_ID FROM PIMS_PROPERTY_ACQUISITION_FILE WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1')));
DELETE FROM PIMS_ACQUISITION_CHECKLIST_ITEM WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_COMP_REQ_H120 WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1')));
DELETE FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACQUISITION_OWNER_SOLICITOR WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_AGREEMENT WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACQ_PAYEE_CHEQUE WHERE ACQUISITION_PAYEE_ID IN (SELECT ACQUISITION_PAYEE_ID FROM PIMS_ACQUISITION_PAYEE WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'))));
DELETE FROM PIMS_ACQUISITION_PAYEE WHERE COMPENSATION_REQUISITION_ID IN (SELECT COMPENSATION_REQUISITION_ID FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1')));
DELETE FROM PIMS_COMPENSATION_REQUISITION WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACQUISITION_CHECKLIST_ITEM WHERE ACQUISITION_FILE_ID IN (SELECT ACQUISITION_FILE_ID FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1'));
DELETE FROM PIMS_ACQUISITION_FILE_NOTE WHERE APP_CREATE_USERID IN ('TRANPSP1');
DELETE FROM PIMS_ACQUISITION_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1');

-- RESEARCH FILES
DELETE FROM PIMS_RESEARCH_FILE_PURPOSE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_FILE_PROJECT WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_ACTIVITY_INSTANCE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_FILE_DOCUMENT WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PRF_PROP_RESEARCH_PURPOSE_TYPE WHERE PROPERTY_RESEARCH_FILE_ID IN (SELECT PROPERTY_RESEARCH_FILE_ID FROM PIMS_PROPERTY_RESEARCH_FILE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA')))
DELETE FROM PIMS_PROPERTY_RESEARCH_FILE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_PROPERTY_RESEARCH_FILE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_FILE_NOTE WHERE RESEARCH_FILE_ID IN (SELECT RESEARCH_FILE_ID FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA'));
DELETE FROM PIMS_RESEARCH_FILE WHERE APP_CREATE_USERID IN ('TRANPSP1', 'TRANPSP2', 'SUTAIRAK','PRAVKUMA');
