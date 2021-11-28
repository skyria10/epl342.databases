CREATE PROCEDURE dbo.Q1

	@username		varchar(30),
	@password		varchar(30),
	@FName			varchar(30),
	@LName			varchar(30),
	@Bdate			date,
	@Sex			int,
	@managerUsername varchar(30)
	
	AS
	BEGIN
	SET NOCOUNT ON
		
		DECLARE @company int
		SET @company = (SELECT Manages 
						FROM dbo.[p-User]
						WHERE Username=@managerUsername)
		

		INSERT INTO dbo.[p-User](
			FName,LName ,Bdate, Sex,[Type], Username, Password, CreatedBy, Manages, WorksFor  
		)
		VALUES(
			@FName,@LName ,@Bdate, @Sex,3, @Username, @Password,@adminUsername, null, @company
		)
END
GO