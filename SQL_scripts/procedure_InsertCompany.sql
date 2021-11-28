CREATE PROCEDURE dbo.InsertCompany
	@Name	varchar(30),
	@EntryDate date,
	@CreatedBy int,
	@username	varchar(30),
	@password	varchar(30),
	@FName		varchar(30),
	@LName		varchar(30),
	@Bdate		date,
	@Sex		int
	
	AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO dbo.[p-Company](
			[Name],EntryDate,Created_By
		)
		VALUES(
			@Name,@EntryDate,@CreatedBy
		)
END
GO
