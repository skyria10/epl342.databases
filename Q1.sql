CREATE PROCEDURE dbo.Q1
	@RecordNum		int,
	@Name			varchar(30),
	@EntryDate 		date,
	@username		varchar(30),
	@password		varchar(30),
	@FName			varchar(30),
	@LName			varchar(30),
	@Bdate			date,
	@Sex			int,
	@adminUsername 	varchar(30)
	
	AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO dbo.[p-Company](
			RecordNum,[Name],EntryDate,Created_By
		)
		VALUES(
			@RecordNum,@Name,@EntryDate,@adminUsername
		)
		INSERT INTO dbo.[p-User](
			FName,LName ,Bdate, Sex,[Type], Username, Password, CreatedBy, Manages, WorksFor  
		)
		VALUES(
			@FName,@LName ,@Bdate, @Sex,2, @Username, @Password,@adminUsername, @RecordNum, @RecordNum
		)
END
GO