DELETE
FROM PIMS_FILE_PROPERTY;
GO

INSERT INTO [dbo].[PIMS_FILE_PROPERTY] ([FILE_ID], [PROPERTY_ID], [PROPERTY_NAME], [CONCURRENCY_CONTROL_NUMBER]) 
	VALUES(1, 1, N'Bubba-Lou Who', 1)
GO