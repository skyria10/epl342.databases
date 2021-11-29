CREATE PROCEDURE dbo.Q1
	@RecordNum		int,
	@Name			nvarchar(30),
	@EntryDate 		date,
	@UserID			int,
	@username		nvarchar(30),
	@password		nvarchar(30),
	@FName			nvarchar(30),
	@LName			nvarchar(30),
	@Bdate			date,
	@Sex			int,
	@adminUsername 	nvarchar(30)
	
	AS
	BEGIN

	DECLARE @adminID AS INT
		SELECT @adminID = UserID
						FROM dbo.[p-Users]
						WHERE Username=@adminUsername
		SET NOCOUNT ON
		INSERT INTO dbo.[p-Company](
			RecordNum,[Name],EntryDate,CreatedBy
		)
		VALUES(
			@RecordNum,@Name,@EntryDate,@adminID
		)
		INSERT INTO dbo.[p-Users](
			UserID,FName,LName ,Bdate, Sex,[Type], Username, Password, CreatedBy, Manages, WorksFor  
		)
		VALUES(
			@UserID,@FName,@LName ,@Bdate, @Sex,2, @Username, @Password, @adminID, @RecordNum, @RecordNum
		)
END
GO
