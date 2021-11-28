CREATE PROCEDURE dbo.Q2
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
		
		UPDATE dbo.[p-Company]
		SET [Name]=@Name,EntryDate=@EntryDate
		WHERE RecordNum=@RecordNum
		
		UPDATE dbo.[p-User](
		SET FName=@FName,LName=@LName ,Bdate=@Bdate, Sex=@Sex, Username=@username, Password=@password
		WHERE Manages=@RecordNum
		
		
END
GO