-- Script generated by Aqua Data Studio Schema Synchronization for MS SQL Server 2016 on Wed Apr 26 16:21:15 PDT 2023
-- Execute this script on:
-- 		PSP_PIMS_S53_00/dbo - This database/schema will be modified
-- to synchronize it with MS SQL Server 2016:
-- 		PSP_PIMS_S52_00/dbo

-- We recommend backing up the database prior to executing the script.

SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_AQPCHQ_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_AQPCHQ_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_AQPCHQ_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_AQPCHQ_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_AQPCHQ_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_AQPCHQ_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_AQPCHQ_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_AQPCHQ_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_AQPCHQ_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_ACQPAY_PIM_AQPCHQ_FK
PRINT N'Drop foreign key constraint dbo.PIM_ACQPAY_PIM_AQPCHQ_FK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_PAYEE_CHEQUE]
	DROP CONSTRAINT IF EXISTS [PIM_ACQPAY_PIM_AQPCHQ_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_ACQOWN_PIM_ACQPAY_FK
PRINT N'Drop foreign key constraint dbo.PIM_ACQOWN_PIM_ACQPAY_FK'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_PAYEE]
	DROP CONSTRAINT IF EXISTS [PIM_ACQOWN_PIM_ACQPAY_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop foreign key constraint dbo.PIM_CMPREQ_PIM_ACQPAY_FK
PRINT N'Drop foreign key constraint dbo.PIM_CMPREQ_PIM_ACQPAY_FK'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_PAYEE]
	DROP CONSTRAINT IF EXISTS [PIM_CMPREQ_PIM_ACQPAY_FK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.AQPCHQ_ACQUISITION_PAYEE_ID_IDX
PRINT N'Drop index dbo.AQPCHQ_ACQUISITION_PAYEE_ID_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_ACQ_PAYEE_CHEQUE].[AQPCHQ_ACQUISITION_PAYEE_ID_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQPAY_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_ACQPAY_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQPAY_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQPAY_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_ACQPAY_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQPAY_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQPAY_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_ACQPAY_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQPAY_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.ACQPAY_COMPENSATION_REQUISITION_ID_IDX
PRINT N'Drop index dbo.ACQPAY_COMPENSATION_REQUISITION_ID_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE].[ACQPAY_COMPENSATION_REQUISITION_ID_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop index dbo.ACQPAY_ACQUISITION_OWNER_ID_IDX
PRINT N'Drop index dbo.ACQPAY_ACQUISITION_OWNER_ID_IDX'
GO
DROP INDEX IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE].[ACQPAY_ACQUISITION_OWNER_ID_IDX]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQOWN_I_S_U_TR
PRINT N'Drop trigger dbo.PIMS_ACQOWN_I_S_U_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQOWN_I_S_U_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQOWN_I_S_I_TR
PRINT N'Drop trigger dbo.PIMS_ACQOWN_I_S_I_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQOWN_I_S_I_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop trigger dbo.PIMS_ACQOWN_A_S_IUD_TR
PRINT N'Drop trigger dbo.PIMS_ACQOWN_A_S_IUD_TR'
GO
DROP TRIGGER IF EXISTS [dbo].[PIMS_ACQOWN_A_S_IUD_TR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop unique constraint dbo.PIMS_AQPCHQ_H_UK
PRINT N'Drop unique constraint dbo.PIMS_AQPCHQ_H_UK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_PAYEE_CHEQUE_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_AQPCHQ_H_UK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.PIMS_AQPCHQ_H_PK
PRINT N'Drop primary key constraint dbo.PIMS_AQPCHQ_H_PK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_PAYEE_CHEQUE_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_AQPCHQ_H_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.AQPCHQ_PK
PRINT N'Drop primary key constraint dbo.AQPCHQ_PK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_PAYEE_CHEQUE]
	DROP CONSTRAINT IF EXISTS [AQPCHQ_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_ACQ_PAYEE_CHEQUE
PRINT N'Drop table dbo.PIMS_ACQ_PAYEE_CHEQUE'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_ACQ_PAYEE_CHEQUE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop unique constraint dbo.PIMS_ACQPAY_H_UK
PRINT N'Drop unique constraint dbo.PIMS_ACQPAY_H_UK'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_PAYEE_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_ACQPAY_H_UK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.PIMS_ACQPAY_H_PK
PRINT N'Drop primary key constraint dbo.PIMS_ACQPAY_H_PK'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_PAYEE_HIST]
	DROP CONSTRAINT IF EXISTS [PIMS_ACQPAY_H_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop primary key constraint dbo.ACQPAY_PK
PRINT N'Drop primary key constraint dbo.ACQPAY_PK'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_PAYEE]
	DROP CONSTRAINT IF EXISTS [ACQPAY_PK]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_ACQUISITION_PAYEE
PRINT N'Drop table dbo.PIMS_ACQUISITION_PAYEE'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.BCA_MINOR_TAXING_ID_SEQ
PRINT N'Create sequence dbo.BCA_MINOR_TAXING_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[BCA_MINOR_TAXING_ID_SEQ]
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

-- Create sequence dbo.BCA_OWNER_ID_SEQ
PRINT N'Create sequence dbo.BCA_OWNER_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[BCA_OWNER_ID_SEQ]
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

-- Create sequence dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_ID_SEQ
PRINT N'Create sequence dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ_ID_SEQ]
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

-- Alter table dbo.PIMS_ACQUISITION_OWNER
PRINT N'Alter table dbo.PIMS_ACQUISITION_OWNER'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_OWNER]
	DROP CONSTRAINT IF EXISTS [ACQOWN_EFFECTIVE_DATE_DEF]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_OWNER]
	DROP COLUMN IF EXISTS [EFFECTIVE_DATE], [EXPIRY_DATE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create table dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ
PRINT N'Create table dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ'
GO
CREATE TABLE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ]  ( 
	[ACQ_OWNER_COMP_REQ_CHQ_ID]     	bigint NOT NULL CONSTRAINT [AOCRCQ_ACQ_OWNER_COMP_REQ_CHQ_ID_DEF]  DEFAULT (NEXT VALUE FOR [PIMS_ACQ_OWNER_COMP_REQ_CHQ_ID_SEQ]),
	[ACQUISITION_OWNER_ID]          	bigint NOT NULL,
	[PRETAX_AMT]                    	money NULL,
	[TAX_AMT]                       	money NULL,
	[TOTAL_AMT]                     	money NULL,
	[CONCURRENCY_CONTROL_NUMBER]    	bigint NOT NULL CONSTRAINT [AOCRCQ_CONCURRENCY_CONTROL_NUMBER_DEF]  DEFAULT ((1)),
	[APP_CREATE_TIMESTAMP]          	datetime NOT NULL CONSTRAINT [AOCRCQ_APP_CREATE_TIMESTAMP_DEF]  DEFAULT (getutcdate()),
	[APP_CREATE_USERID]             	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_APP_CREATE_USERID_DEF]  DEFAULT (user_name()),
	[APP_CREATE_USER_GUID]          	uniqueidentifier NULL,
	[APP_CREATE_USER_DIRECTORY]     	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_APP_CREATE_USER_DIRECTORY_DEF]  DEFAULT (user_name()),
	[APP_LAST_UPDATE_TIMESTAMP]     	datetime NOT NULL CONSTRAINT [AOCRCQ_APP_LAST_UPDATE_TIMESTAMP_DEF]  DEFAULT (getutcdate()),
	[APP_LAST_UPDATE_USERID]        	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_APP_LAST_UPDATE_USERID_DEF]  DEFAULT (user_name()),
	[APP_LAST_UPDATE_USER_GUID]     	uniqueidentifier NULL,
	[APP_LAST_UPDATE_USER_DIRECTORY]	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_APP_LAST_UPDATE_USER_DIRECTORY_DEF]  DEFAULT (user_name()),
	[DB_CREATE_TIMESTAMP]           	datetime NOT NULL CONSTRAINT [AOCRCQ_DB_CREATE_TIMESTAMP_DEF]  DEFAULT (getutcdate()),
	[DB_CREATE_USERID]              	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_DB_CREATE_USERID_DEF]  DEFAULT (user_name()),
	[DB_LAST_UPDATE_TIMESTAMP]      	datetime NOT NULL CONSTRAINT [AOCRCQ_DB_LAST_UPDATE_TIMESTAMP_DEF]  DEFAULT (getutcdate()),
	[DB_LAST_UPDATE_USERID]         	nvarchar(30) NOT NULL CONSTRAINT [AOCRCQ_DB_LAST_UPDATE_USERID_DEF]  DEFAULT (user_name()),
	CONSTRAINT [AOCRCQ_PK] PRIMARY KEY CLUSTERED([ACQ_OWNER_COMP_REQ_CHQ_ID])
 ON [PRIMARY])
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Subtotal of the owner''s cheque related to the requisition.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_ACQ_OWNER_COMP_REQ_CHQ', 
	@level2type = N'Column', @level2name = N'PRETAX_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Taxes related to the owner''s cheque related to the requisition.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_ACQ_OWNER_COMP_REQ_CHQ', 
	@level2type = N'Column', @level2name = N'TAX_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Total value of the owner''s cheque related to the requisition.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_ACQ_OWNER_COMP_REQ_CHQ', 
	@level2type = N'Column', @level2name = N'TOTAL_AMT'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description', @value = N'Table associating cheques for an acquisition file owner with a compenstion requisition.' , 
	@level0type = N'Schema', @level0name = N'dbo', 
	@level1type = N'Table', @level1name = N'PIMS_ACQ_OWNER_COMP_REQ_CHQ'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create sequence dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_H_ID_SEQ
PRINT N'Create sequence dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_H_ID_SEQ'
GO
CREATE SEQUENCE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ_H_ID_SEQ]
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

-- Create table dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST
PRINT N'Create table dbo.PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST'
GO
CREATE TABLE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST]  ( 
	[_ACQ_OWNER_COMP_REQ_CHQ_HIST_ID]	bigint NOT NULL DEFAULT (NEXT VALUE FOR [PIMS_ACQ_OWNER_COMP_REQ_CHQ_H_ID_SEQ]),
	[EFFECTIVE_DATE_HIST]            	datetime NOT NULL DEFAULT (getutcdate()),
	[END_DATE_HIST]                  	datetime NULL,
	[ACQ_OWNER_COMP_REQ_CHQ_ID]      	bigint NOT NULL,
	[ACQUISITION_OWNER_ID]           	bigint NOT NULL,
	[PRETAX_AMT]                     	money NULL,
	[TAX_AMT]                        	money NULL,
	[TOTAL_AMT]                      	money NULL,
	[CONCURRENCY_CONTROL_NUMBER]     	bigint NOT NULL,
	[APP_CREATE_TIMESTAMP]           	datetime NOT NULL,
	[APP_CREATE_USERID]              	nvarchar(30) NOT NULL,
	[APP_CREATE_USER_GUID]           	uniqueidentifier NULL,
	[APP_CREATE_USER_DIRECTORY]      	nvarchar(30) NOT NULL,
	[APP_LAST_UPDATE_TIMESTAMP]      	datetime NOT NULL,
	[APP_LAST_UPDATE_USERID]         	nvarchar(30) NOT NULL,
	[APP_LAST_UPDATE_USER_GUID]      	uniqueidentifier NULL,
	[APP_LAST_UPDATE_USER_DIRECTORY] 	nvarchar(30) NOT NULL,
	[DB_CREATE_TIMESTAMP]            	datetime NOT NULL,
	[DB_CREATE_USERID]               	nvarchar(30) NOT NULL,
	[DB_LAST_UPDATE_TIMESTAMP]       	datetime NOT NULL,
	[DB_LAST_UPDATE_USERID]          	nvarchar(30) NOT NULL,
	CONSTRAINT [PIMS_AOCRCQ_H_PK] PRIMARY KEY CLUSTERED([_ACQ_OWNER_COMP_REQ_CHQ_HIST_ID])
 ON [PRIMARY])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create unique constraint dbo.PIMS_AOCRCQ_H_UK
PRINT N'Create unique constraint dbo.PIMS_AOCRCQ_H_UK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST]
	ADD CONSTRAINT [PIMS_AOCRCQ_H_UK]
	UNIQUE ([_ACQ_OWNER_COMP_REQ_CHQ_HIST_ID], [END_DATE_HIST]) 
	WITH (
		DATA_COMPRESSION = NONE
	) ON [PRIMARY]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Alter table dbo.PIMS_ACQUISITION_OWNER_HIST
PRINT N'Alter table dbo.PIMS_ACQUISITION_OWNER_HIST'
GO
ALTER TABLE [dbo].[PIMS_ACQUISITION_OWNER_HIST]
	DROP COLUMN IF EXISTS [EFFECTIVE_DATE], [EXPIRY_DATE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create index dbo.AOCRCQ_ACQUISITION_OWNER_ID_IDX
PRINT N'Create index dbo.AOCRCQ_ACQUISITION_OWNER_ID_IDX'
GO
CREATE NONCLUSTERED INDEX [AOCRCQ_ACQUISITION_OWNER_ID_IDX]
	ON [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ]([ACQUISITION_OWNER_ID])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_AOCRCQ_A_S_IUD_TR
PRINT N'Create trigger dbo.PIMS_AOCRCQ_A_S_IUD_TR'
GO
CREATE TRIGGER [dbo].[PIMS_AOCRCQ_A_S_IUD_TR] ON PIMS_ACQ_OWNER_COMP_REQ_CHQ FOR INSERT, UPDATE, DELETE AS
SET NOCOUNT ON
BEGIN TRY
DECLARE @curr_date datetime;
SET @curr_date = getutcdate();
  IF NOT EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- historical
  IF EXISTS(SELECT * FROM deleted)
    update PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST set END_DATE_HIST = @curr_date where ACQ_OWNER_COMP_REQ_CHQ_ID in (select ACQ_OWNER_COMP_REQ_CHQ_ID from deleted) and END_DATE_HIST is null;
  
  IF EXISTS(SELECT * FROM inserted)
    insert into PIMS_ACQ_OWNER_COMP_REQ_CHQ_HIST ([ACQ_OWNER_COMP_REQ_CHQ_ID], [ACQUISITION_OWNER_ID], [PRETAX_AMT], [TAX_AMT], [TOTAL_AMT], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], _ACQ_OWNER_COMP_REQ_CHQ_HIST_ID, END_DATE_HIST, EFFECTIVE_DATE_HIST)
      select [ACQ_OWNER_COMP_REQ_CHQ_ID], [ACQUISITION_OWNER_ID], [PRETAX_AMT], [TAX_AMT], [TOTAL_AMT], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], (next value for [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ_H_ID_SEQ]) as [_ACQ_OWNER_COMP_REQ_CHQ_HIST_ID], null as [END_DATE_HIST], @curr_date as [EFFECTIVE_DATE_HIST] from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_AOCRCQ_I_S_U_TR
PRINT N'Create trigger dbo.PIMS_AOCRCQ_I_S_U_TR'
GO
CREATE TRIGGER [dbo].[PIMS_AOCRCQ_I_S_U_TR] ON PIMS_ACQ_OWNER_COMP_REQ_CHQ INSTEAD OF UPDATE AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- validate concurrency control
  if exists (select 1 from inserted, deleted where inserted.CONCURRENCY_CONTROL_NUMBER != deleted.CONCURRENCY_CONTROL_NUMBER+1 AND inserted.ACQ_OWNER_COMP_REQ_CHQ_ID = deleted.ACQ_OWNER_COMP_REQ_CHQ_ID)
    raiserror('CONCURRENCY FAILURE.',16,1)


  -- update statement
  update PIMS_ACQ_OWNER_COMP_REQ_CHQ
    set "ACQ_OWNER_COMP_REQ_CHQ_ID" = inserted."ACQ_OWNER_COMP_REQ_CHQ_ID",
      "ACQUISITION_OWNER_ID" = inserted."ACQUISITION_OWNER_ID",
      "PRETAX_AMT" = inserted."PRETAX_AMT",
      "TAX_AMT" = inserted."TAX_AMT",
      "TOTAL_AMT" = inserted."TOTAL_AMT",
      "CONCURRENCY_CONTROL_NUMBER" = inserted."CONCURRENCY_CONTROL_NUMBER",
      "APP_LAST_UPDATE_TIMESTAMP" = inserted."APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID" = inserted."APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID" = inserted."APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY" = inserted."APP_LAST_UPDATE_USER_DIRECTORY"
    , DB_LAST_UPDATE_TIMESTAMP = getutcdate()
    , DB_LAST_UPDATE_USERID = user_name()
    from PIMS_ACQ_OWNER_COMP_REQ_CHQ
    inner join inserted
    on (PIMS_ACQ_OWNER_COMP_REQ_CHQ.ACQ_OWNER_COMP_REQ_CHQ_ID = inserted.ACQ_OWNER_COMP_REQ_CHQ_ID);

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_ACQOWN_A_S_IUD_TR
PRINT N'Create trigger dbo.PIMS_ACQOWN_A_S_IUD_TR'
GO
CREATE TRIGGER [dbo].[PIMS_ACQOWN_A_S_IUD_TR] ON PIMS_ACQUISITION_OWNER FOR INSERT, UPDATE, DELETE AS
SET NOCOUNT ON
BEGIN TRY
DECLARE @curr_date datetime;
SET @curr_date = getutcdate();
  IF NOT EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- historical
  IF EXISTS(SELECT * FROM deleted)
    update PIMS_ACQUISITION_OWNER_HIST set END_DATE_HIST = @curr_date where ACQUISITION_OWNER_ID in (select ACQUISITION_OWNER_ID from deleted) and END_DATE_HIST is null;
  
  IF EXISTS(SELECT * FROM inserted)
    insert into PIMS_ACQUISITION_OWNER_HIST ([ACQUISITION_OWNER_ID], [ACQUISITION_FILE_ID], [ADDRESS_ID], [IS_PRIMARY_OWNER], [IS_ORGANIZATION], [LAST_NAME_AND_CORP_NAME], [OTHER_NAME], [GIVEN_NAME], [INCORPORATION_NUMBER], [REGISTRATION_NUMBER], [CONTACT_EMAIL_ADDR], [CONTACT_PHONE_NUM], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], _ACQUISITION_OWNER_HIST_ID, END_DATE_HIST, EFFECTIVE_DATE_HIST)
      select [ACQUISITION_OWNER_ID], [ACQUISITION_FILE_ID], [ADDRESS_ID], [IS_PRIMARY_OWNER], [IS_ORGANIZATION], [LAST_NAME_AND_CORP_NAME], [OTHER_NAME], [GIVEN_NAME], [INCORPORATION_NUMBER], [REGISTRATION_NUMBER], [CONTACT_EMAIL_ADDR], [CONTACT_PHONE_NUM], [CONCURRENCY_CONTROL_NUMBER], [APP_CREATE_TIMESTAMP], [APP_CREATE_USERID], [APP_CREATE_USER_GUID], [APP_CREATE_USER_DIRECTORY], [APP_LAST_UPDATE_TIMESTAMP], [APP_LAST_UPDATE_USERID], [APP_LAST_UPDATE_USER_GUID], [APP_LAST_UPDATE_USER_DIRECTORY], [DB_CREATE_TIMESTAMP], [DB_CREATE_USERID], [DB_LAST_UPDATE_TIMESTAMP], [DB_LAST_UPDATE_USERID], (next value for [dbo].[PIMS_ACQUISITION_OWNER_H_ID_SEQ]) as [_ACQUISITION_OWNER_HIST_ID], null as [END_DATE_HIST], @curr_date as [EFFECTIVE_DATE_HIST] from inserted;

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create trigger dbo.PIMS_AOCRCQ_I_S_I_TR
PRINT N'Create trigger dbo.PIMS_AOCRCQ_I_S_I_TR'
GO
CREATE TRIGGER [dbo].[PIMS_AOCRCQ_I_S_I_TR] ON PIMS_ACQ_OWNER_COMP_REQ_CHQ INSTEAD OF INSERT AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM inserted) 
    RETURN;

  
  insert into PIMS_ACQ_OWNER_COMP_REQ_CHQ ("ACQ_OWNER_COMP_REQ_CHQ_ID",
      "ACQUISITION_OWNER_ID",
      "PRETAX_AMT",
      "TAX_AMT",
      "TOTAL_AMT",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY")
    select "ACQ_OWNER_COMP_REQ_CHQ_ID",
      "ACQUISITION_OWNER_ID",
      "PRETAX_AMT",
      "TAX_AMT",
      "TOTAL_AMT",
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

-- Create trigger dbo.PIMS_ACQOWN_I_S_I_TR
PRINT N'Create trigger dbo.PIMS_ACQOWN_I_S_I_TR'
GO
CREATE TRIGGER [dbo].[PIMS_ACQOWN_I_S_I_TR] ON PIMS_ACQUISITION_OWNER INSTEAD OF INSERT AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM inserted) 
    RETURN;

  
  insert into PIMS_ACQUISITION_OWNER ("ACQUISITION_OWNER_ID",
      "ACQUISITION_FILE_ID",
      "ADDRESS_ID",
      "IS_PRIMARY_OWNER",
      "IS_ORGANIZATION",
      "LAST_NAME_AND_CORP_NAME",
      "OTHER_NAME",
      "GIVEN_NAME",
      "INCORPORATION_NUMBER",
      "REGISTRATION_NUMBER",
      "CONTACT_EMAIL_ADDR",
      "CONTACT_PHONE_NUM",
      "CONCURRENCY_CONTROL_NUMBER",
      "APP_CREATE_TIMESTAMP",
      "APP_CREATE_USERID",
      "APP_CREATE_USER_GUID",
      "APP_CREATE_USER_DIRECTORY",
      "APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY")
    select "ACQUISITION_OWNER_ID",
      "ACQUISITION_FILE_ID",
      "ADDRESS_ID",
      "IS_PRIMARY_OWNER",
      "IS_ORGANIZATION",
      "LAST_NAME_AND_CORP_NAME",
      "OTHER_NAME",
      "GIVEN_NAME",
      "INCORPORATION_NUMBER",
      "REGISTRATION_NUMBER",
      "CONTACT_EMAIL_ADDR",
      "CONTACT_PHONE_NUM",
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

-- Create trigger dbo.PIMS_ACQOWN_I_S_U_TR
PRINT N'Create trigger dbo.PIMS_ACQOWN_I_S_U_TR'
GO
CREATE TRIGGER [dbo].[PIMS_ACQOWN_I_S_U_TR] ON PIMS_ACQUISITION_OWNER INSTEAD OF UPDATE AS
SET NOCOUNT ON
BEGIN TRY
  IF NOT EXISTS(SELECT * FROM deleted) 
    RETURN;

  -- validate concurrency control
  if exists (select 1 from inserted, deleted where inserted.CONCURRENCY_CONTROL_NUMBER != deleted.CONCURRENCY_CONTROL_NUMBER+1 AND inserted.ACQUISITION_OWNER_ID = deleted.ACQUISITION_OWNER_ID)
    raiserror('CONCURRENCY FAILURE.',16,1)


  -- update statement
  update PIMS_ACQUISITION_OWNER
    set "ACQUISITION_OWNER_ID" = inserted."ACQUISITION_OWNER_ID",
      "ACQUISITION_FILE_ID" = inserted."ACQUISITION_FILE_ID",
      "ADDRESS_ID" = inserted."ADDRESS_ID",
      "IS_PRIMARY_OWNER" = inserted."IS_PRIMARY_OWNER",
      "IS_ORGANIZATION" = inserted."IS_ORGANIZATION",
      "LAST_NAME_AND_CORP_NAME" = inserted."LAST_NAME_AND_CORP_NAME",
      "OTHER_NAME" = inserted."OTHER_NAME",
      "GIVEN_NAME" = inserted."GIVEN_NAME",
      "INCORPORATION_NUMBER" = inserted."INCORPORATION_NUMBER",
      "REGISTRATION_NUMBER" = inserted."REGISTRATION_NUMBER",
      "CONTACT_EMAIL_ADDR" = inserted."CONTACT_EMAIL_ADDR",
      "CONTACT_PHONE_NUM" = inserted."CONTACT_PHONE_NUM",
      "CONCURRENCY_CONTROL_NUMBER" = inserted."CONCURRENCY_CONTROL_NUMBER",
      "APP_LAST_UPDATE_TIMESTAMP" = inserted."APP_LAST_UPDATE_TIMESTAMP",
      "APP_LAST_UPDATE_USERID" = inserted."APP_LAST_UPDATE_USERID",
      "APP_LAST_UPDATE_USER_GUID" = inserted."APP_LAST_UPDATE_USER_GUID",
      "APP_LAST_UPDATE_USER_DIRECTORY" = inserted."APP_LAST_UPDATE_USER_DIRECTORY"
    , DB_LAST_UPDATE_TIMESTAMP = getutcdate()
    , DB_LAST_UPDATE_USERID = user_name()
    from PIMS_ACQUISITION_OWNER
    inner join inserted
    on (PIMS_ACQUISITION_OWNER.ACQUISITION_OWNER_ID = inserted.ACQUISITION_OWNER_ID);

END TRY
BEGIN CATCH
   IF @@trancount > 0 ROLLBACK TRANSACTION
   EXEC pims_error_handling
END CATCH;

GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Create foreign key constraint dbo.PIM_ACQOWN_PIM_AOCRCQ_FK
PRINT N'Create foreign key constraint dbo.PIM_ACQOWN_PIM_AOCRCQ_FK'
GO
ALTER TABLE [dbo].[PIMS_ACQ_OWNER_COMP_REQ_CHQ]
	ADD CONSTRAINT [PIM_ACQOWN_PIM_AOCRCQ_FK]
	FOREIGN KEY([ACQUISITION_OWNER_ID])
	REFERENCES [dbo].[PIMS_ACQUISITION_OWNER]([ACQUISITION_OWNER_ID])
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_ACQ_PAYEE_CHEQUE_HIST
PRINT N'Drop table dbo.PIMS_ACQ_PAYEE_CHEQUE_HIST'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_ACQ_PAYEE_CHEQUE_HIST]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_ACQ_PAYEE_CHEQUE_H_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_ACQ_PAYEE_CHEQUE_H_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_ACQ_PAYEE_CHEQUE_H_ID_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_ACQ_PAYEE_CHEQUE_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_ACQ_PAYEE_CHEQUE_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_ACQ_PAYEE_CHEQUE_ID_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop table dbo.PIMS_ACQUISITION_PAYEE_HIST
PRINT N'Drop table dbo.PIMS_ACQUISITION_PAYEE_HIST'
GO
DROP TABLE IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE_HIST]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_ACQUISITION_PAYEE_H_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_ACQUISITION_PAYEE_H_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE_H_ID_SEQ]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO

-- Drop sequence dbo.PIMS_ACQUISITION_PAYEE_ID_SEQ
PRINT N'Drop sequence dbo.PIMS_ACQUISITION_PAYEE_ID_SEQ'
GO
DROP SEQUENCE IF EXISTS [dbo].[PIMS_ACQUISITION_PAYEE_ID_SEQ]
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