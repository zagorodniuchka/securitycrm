﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if not exists(select UserId from [User])
	BEGIN	

		INSERT INTO [Sex](Name,CreatedBy,DateCreated)
		VALUES ('male',1,dbo.GetZoneDate())
		
		INSERT INTO [Sex](Name,CreatedBy,DateCreated)
		VALUES ('female',1,dbo.GetZoneDate())

		declare @personId bigint, @roleId bigint

		INSERT INTO [Person](FirstName,LastName,Email,SexId,BirthDate,CreatedBy,DateCreated)
		VALUES ('system','administrator','',1,dbo.GetZoneDate(),1,dbo.GetZoneDate())
		
		SET @personId = SCOPE_IDENTITY()

		INSERT INTO [Role](Name,Permission,CreatedBy,DateCreated)
		VALUES ('administrator',2,1,dbo.GetZoneDate())
		
		SET @roleId = SCOPE_IDENTITY()

		INSERT INTO [User](Login,Password,Timeout,[Permission],RoleId,PersonId,UniqueId,CreatedBy,DateCreated)
		VALUES ('admin','3C73F17CC2E8CD8798CB962C18C4C666',10000,0,@roleId,@personId,NEWID(),1,dbo.GetZoneDate())
	END