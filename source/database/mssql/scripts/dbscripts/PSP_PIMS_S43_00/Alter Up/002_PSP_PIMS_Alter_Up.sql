-- Script generated by Aqua Data Studio Schema Synchronization for MS SQL Server 2016 on Wed Dec 07 12:14:16 PST 2022
-- Execute this script on:
-- 		PSP_PIMS_S42_00/dbo - This database/schema will be modified
-- to synchronize it with MS SQL Server 2016:
-- 		PSP_PIMS_S43_00/dbo

-- We recommend backing up the database prior to executing the script.

SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPLS_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_PROPLS_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPLS_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPLS_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_PROPLS_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPLS_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_PROPLS_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_PROPLS_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_PROPLS_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop view dbo.PIMS_PROPERTY_BOUNDARY_VW
PRINT N'Drop view dbo.PIMS_PROPERTY_BOUNDARY_VW'
GO
DROP VIEW IF EXISTS [dbo].[PIMS_PROPERTY_BOUNDARY_VW]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop view dbo.PIMS_PROPERTY_LOCATION_VW
PRINT N'Drop view dbo.PIMS_PROPERTY_LOCATION_VW'
GO
DROP VIEW IF EXISTS [dbo].[PIMS_PROPERTY_LOCATION_VW]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_PRODUCT_WORK_ACTIVITY_ID_SEQ
PRINT N'Create sequence dbo.PIMS_PRODUCT_WORK_ACTIVITY_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_PRODUCT_WORK_ACTIVITY_ID_SEQ]
	AS bigint
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	NO CYCLE
	CACHE 50
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_PRODUCT_ID_SEQ
PRINT N'Create sequence dbo.PIMS_PRODUCT_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_PRODUCT_ID_SEQ]
	AS bigint
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	NO CYCLE
	CACHE 50
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_PRODUCT_BUSINESS_FUNCTION_ID_SEQ
PRINT N'Create sequence dbo.PIMS_PRODUCT_BUSINESS_FUNCTION_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_PRODUCT_BUSINESS_FUNCTION_ID_SEQ]
	AS bigint
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	NO CYCLE
	CACHE 50
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_PRODUCT_COST_ID_SEQ
PRINT N'Create sequence dbo.PIMS_PRODUCT_COST_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_PRODUCT_COST_ID_SEQ]
	AS bigint
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	NO CYCLE
	CACHE 50
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY_LEASE
PRINT N'Alter table dbo.PIMS_PROPERTY_LEASE'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_LEASE]
	ADD [NAME] nvarchar(250) NULL
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Property/lease name' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_PROPERTY_LEASE', 
	@level2type = N'Column', @level2name = N'NAME'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_PROPERTY_LEASE_HIST
PRINT N'Alter table dbo.PIMS_PROPERTY_LEASE_HIST'
GO
ALTER TABLE [dbo].[PIMS_PROPERTY_LEASE_HIST]
	ADD [NAME] nvarchar(250) NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create view dbo.PIMS_PROPERTY_LOCATION_VW
PRINT N'Create view dbo.PIMS_PROPERTY_LOCATION_VW'
GO
CREATE VIEW [dbo].[PIMS_PROPERTY_LOCATION_VW] AS
SELECT PROP.PROPERTY_ID
     , PROP.PID
     , RIGHT('000000000' + CAST(PROP.PID AS VARCHAR(9)), 9) AS PID_PADDED
     , PROP.PIN                   
     , PROP.PROPERTY_TYPE_CODE
     , PROP.PROPERTY_STATUS_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_EFFECTIVE_DATE
     , PROP.PROPERTY_CLASSIFICATION_TYPE_CODE  
     , (SELECT STRING_AGG(TENURE_DESC, ', ')
        FROM   (SELECT TNUR.DESCRIPTION AS TENURE_DESC
                FROM   PIMS_PROPERTY_TENURE_TYPE  TNUR INNER JOIN
                       PIMS_PROP_PROP_TENURE_TYPE TNTY ON TNTY.PROPERTY_TENURE_TYPE_CODE = TNUR.PROPERTY_TENURE_TYPE_CODE
                                                      AND TNTY.PROPERTY_ID               = PROP.PROPERTY_ID) temp) AS PROPERTY_TENURE_TYPE_CODE
     , ADDR.STREET_ADDRESS_1
     , ADDR.STREET_ADDRESS_2
     , ADDR.STREET_ADDRESS_3
     , ADDR.MUNICIPALITY_NAME
     , ADDR.POSTAL_CODE
     , PROV.PROVINCE_STATE_CODE
     , PROV.DESCRIPTION AS PROVINCE_NAME
     , CNTY.COUNTRY_CODE
     , CNTY.DESCRIPTION AS COUNTRY_NAME
     , PROP.NAME
     , PROP.DESCRIPTION
     , PROP.ADDRESS_ID
     , PROP.REGION_CODE
     , PROP.DISTRICT_CODE
     , PROP.LOCATION AS GEOMETRY
     , PROP.PROPERTY_AREA_UNIT_TYPE_CODE
     , PROP.LAND_AREA
     , PROP.LAND_LEGAL_DESCRIPTION
     , PROP.ENCUMBRANCE_REASON
     , PROP.IS_SENSITIVE
     , PROP.IS_OWNED
     , PROP.IS_PROPERTY_OF_INTEREST
     , PROP.IS_VISIBLE_TO_OTHER_AGENCIES
     , PROP.ZONING
     , PROP.ZONING_POTENTIAL
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_PAYABLE_LEASE                       
FROM   PIMS_PROPERTY       PROP                                                    LEFT OUTER JOIN
       PIMS_ADDRESS        ADDR ON ADDR.ADDRESS_ID        = PROP.ADDRESS_ID        LEFT OUTER JOIN
       PIMS_PROVINCE_STATE PROV ON PROV.PROVINCE_STATE_ID = ADDR.PROVINCE_STATE_ID LEFT OUTER JOIN
       PIMS_COUNTRY        CNTY ON CNTY.COUNTRY_ID        = ADDR.COUNTRY_ID
WHERE  PROP.LOCATION IS NOT NULL

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create view dbo.PIMS_PROPERTY_BOUNDARY_VW
PRINT N'Create view dbo.PIMS_PROPERTY_BOUNDARY_VW'
GO
CREATE VIEW [dbo].[PIMS_PROPERTY_BOUNDARY_VW] AS
SELECT PROP.PROPERTY_ID
     , PROP.PID
     , RIGHT('000000000' + CAST(PROP.PID AS VARCHAR(9)), 9) AS PID_PADDED
     , PROP.PIN
     , PROP.PROPERTY_TYPE_CODE
     , PROP.PROPERTY_STATUS_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_TYPE_CODE
     , PROP.PROPERTY_DATA_SOURCE_EFFECTIVE_DATE
     , PROP.PROPERTY_CLASSIFICATION_TYPE_CODE  
     , (SELECT STRING_AGG(TENURE_DESC, ', ')
        FROM   (SELECT TNUR.DESCRIPTION AS TENURE_DESC
                FROM   PIMS_PROPERTY_TENURE_TYPE  TNUR INNER JOIN
                       PIMS_PROP_PROP_TENURE_TYPE TNTY ON TNTY.PROPERTY_TENURE_TYPE_CODE = TNUR.PROPERTY_TENURE_TYPE_CODE
                                                      AND TNTY.PROPERTY_ID               = PROP.PROPERTY_ID) temp) AS PROPERTY_TENURE_TYPE_CODE
     , ADDR.STREET_ADDRESS_1
     , ADDR.STREET_ADDRESS_2
     , ADDR.STREET_ADDRESS_3
     , ADDR.MUNICIPALITY_NAME
     , ADDR.POSTAL_CODE
     , PROV.PROVINCE_STATE_CODE
     , PROV.DESCRIPTION AS PROVINCE_NAME
     , CNTY.COUNTRY_CODE
     , CNTY.DESCRIPTION AS COUNTRY_NAME
     , PROP.NAME
     , PROP.DESCRIPTION                                                                                                                                    
     , PROP.ADDRESS_ID
     , PROP.REGION_CODE
     , PROP.DISTRICT_CODE
     , PROP.BOUNDARY AS GEOMETRY
     , PROP.PROPERTY_AREA_UNIT_TYPE_CODE
     , PROP.LAND_AREA
     , PROP.LAND_LEGAL_DESCRIPTION
     , PROP.ENCUMBRANCE_REASON
     , PROP.IS_SENSITIVE
     , PROP.IS_OWNED
     , PROP.IS_PROPERTY_OF_INTEREST
     , PROP.IS_VISIBLE_TO_OTHER_AGENCIES
     , PROP.ZONING
     , PROP.ZONING_POTENTIAL
     , IIF(EXISTS (SELECT 1
                   FROM   PIMS_PROPERTY_LEASE PRLS JOIN
                          PIMS_LEASE          LEAS ON PRLS.PROPERTY_ID = PROP.PROPERTY_ID
                                                  AND PRLS.LEASE_ID    = LEAS.LEASE_ID
                   WHERE  LEAS.LEASE_PAY_RVBL_TYPE_CODE IN ('PYBLMOTI', 'PYBLBCTFA')), CONVERT([bit],(1)), CONVERT([bit],(0))) AS IS_PAYABLE_LEASE
FROM   PIMS_PROPERTY       PROP                                                    LEFT OUTER JOIN
       PIMS_ADDRESS        ADDR ON ADDR.ADDRESS_ID        = PROP.ADDRESS_ID        LEFT OUTER JOIN
       PIMS_PROVINCE_STATE PROV ON PROV.PROVINCE_STATE_ID = ADDR.PROVINCE_STATE_ID LEFT OUTER JOIN
       PIMS_COUNTRY        CNTY ON CNTY.COUNTRY_ID        = ADDR.COUNTRY_ID
WHERE  PROP.BOUNDARY IS NOT NULL

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PROPLS_I_S_U_TR
PRINT N'Create trigger dbo.PIMS_PROPLS_I_S_U_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PROPLS_I_S_U_TR] ON PIMS_PROPERTY_LEASE INSTEAD OF UPDATE AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- validate concurrency control
  if exists (select 1 from inserted, deleted where inserted.CONCURRENCY_CONTROL_NUMBER != deleted.CONCURRENCY_CONTROL_NUMBER+1 AND inserted.PROPERTY_LEASE_ID = deleted.PROPERTY_LEASE_ID)
    raiserror('CONCURRENCY FAILURE.',16,1)


  -- update statement
  update PIMS_PROPERTY_LEASE
    set "PROPERTY_LEASE_ID" = inserted."PROPERTY_LEASE_ID",
      "PROPERTY_ID" = inserted."PROPERTY_ID",
      "LEASE_ID" = inserted."LEASE_ID",
      "AREA_UNIT_TYPE_CODE" = inserted."AREA_UNIT_TYPE_CODE",
      "NAME" = inserted."NAME",
      "LEASE_AREA" = inserted."LEASE_AREA",
      "CONCURRENCY_CONTROL_NUMBER" = inserted."CONCURRENCY_CONTROL_NUMBER",
      "APP_LAST_UPDATE_TIMESTAMP" = inserted."APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID" = inserted."APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID" = inserted."APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY" = inserted."APP_LAST_UPDATE_USER_DIRECTORY"
    , DB_LAST_UPDATE_TIMESTAMP = getutcdate()
    , DB_LAST_UPDATE_USERID = user_name()
    from PIMS_PROPERTY_LEASE
    inner join inserted
    on (PIMS_PROPERTY_LEASE.PROPERTY_LEASE_ID = inserted.PROPERTY_LEASE_ID);

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PROPLS_A_S_IUD_TR
PRINT N'Create trigger dbo.PIMS_PROPLS_A_S_IUD_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PROPLS_A_S_IUD_TR] ON PIMS_PROPERTY_LEASE FOR INSERT, UPDATE, DELETE AS
SET NOCOUNT ON
BEGIN TRY
DECLARE @curr_date datetime;
SET @curr_date = getutcdate();
  IF NOT EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- historical
  IF EXISTS(SELECT * FROM deleted)
    update PIMS_PROPERTY_LEASE_HIST set END_DATE_HIST = @curr_date where PROPERTY_LEASE_ID in (select PROPERTY_LEASE_ID from deleted) and END_DATE_HIST is null;
  
  IF EXISTS(SELECT * FROM inserted)
    insert into PIMS_PROPERTY_LEASE_HIST ([PROPERTY_LEASE_ID], [PROPERTY_ID], [LEASE_ID], [AREA_UNIT_TYPE_CODE], [NAME], [LEASE_AREA], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], _PROPERTY_LEASE_HIST_ID, END_DATE_HIST, EFFECTIVE_DATE_HIST)
      select [PROPERTY_LEASE_ID], [PROPERTY_ID], [LEASE_ID], [AREA_UNIT_TYPE_CODE], [NAME], [LEASE_AREA], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], (next value for [dbo].[PIMS_PROPERTY_LEASE_H_ID_SEQ]) as [_PROPERTY_LEASE_HIST_ID], null as [END_DATE_HIST], @curr_date as [EFFECTIVE_DATE_HIST] from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_PROPLS_I_S_I_TR
PRINT N'Create trigger dbo.PIMS_PROPLS_I_S_I_TR'
GO
CREATE TRIGGER [dbo].[PIMS_PROPLS_I_S_I_TR] ON PIMS_PROPERTY_LEASE INSTEAD OF INSERT AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM inserted) 
    RETURN;

  
  insert into PIMS_PROPERTY_LEASE ("PROPERTY_LEASE_ID",
      "PROPERTY_ID",
      "LEASE_ID",
      "AREA_UNIT_TYPE_CODE",
      "NAME",
      "LEASE_AREA",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY")
    select "PROPERTY_LEASE_ID",
      "PROPERTY_ID",
      "LEASE_ID",
      "AREA_UNIT_TYPE_CODE",
      "NAME",
      "LEASE_AREA",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY"
    from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
   IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
   PRINT 'The database update failed'
END
GO