USE [Tarea1]
GO
/****** Object:  StoredProcedure [dbo].[ValidacionUsuario]    Script Date: 9/3/2022 11:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Julian Gutierrez, Victor Nuñez
-- Create date: 3/9/22
-- Description:	SP que valida un UserName y Password
-- =============================================
ALTER PROCEDURE [dbo].[ValidacionUsuario]
	-- Add the parameters for the stored procedure here
	@UserName VARCHAR(32),
	@Password VARCHAR(32),
	@Message VARCHAR(32) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF(NOT EXISTS(SELECT * FROM Usuario WHERE UserName = @UserName AND Password = @Password))
	BEGIN
		RETURN 1 --No existe el usuario/password
	END
	ELSE
	BEGIN
		RETURN 0 --El usuario y password coinciden con la informacion en la BD
	END
END
