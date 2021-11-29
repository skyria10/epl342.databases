CREATE PROCEDURE dbo.Q4Edit
	
	@toBeEditedID		int,
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
		
		DECLARE @company AS int
		SELECT @company= Manages 
						FROM dbo.[p-Users]
						WHERE Username=@managerUsername
		
		UPDATE dbo.[p-Users]
		SET FName=@FName,LName=@LName ,Bdate=@Bdate, Sex=@Sex, Username=@username, Password=@password
		WHERE userID= @toBeEditedID
END
GO
