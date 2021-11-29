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
		
		UPDATE dbo.[p-User](
		SET FName=@FName,LName=@LName ,Bdate=@Bdate, Sex=@Sex, Username=@username, Password=@password
		WHERE userID= ???????????????????????????
END
GO