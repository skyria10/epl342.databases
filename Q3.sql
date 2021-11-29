CREATE PROCEDURE dbo.Q3

	@userID			int,
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
		
		DECLARE @adminID AS INT
		SELECT @adminID = UserID
						FROM dbo.[p-Users]
						WHERE Username=@managerUsername

		DECLARE @company AS INT
		SELECT	@company= Manages 
				FROM dbo.[p-Users]
				WHERE Username=@managerUsername
		

		INSERT INTO dbo.[p-Users](
			UserID,FName,LName ,Bdate, Sex,[Type], Username, Password, CreatedBy, Manages, WorksFor  
		)
		VALUES(
			@UserID,@FName,@LName ,@Bdate, @Sex,3, @Username, @Password,@adminID, null, @company
		)
END
GO

