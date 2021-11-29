CREATE PROCEDURE dbo.Q5

	@qType			int,
	@qText			varchar(30),
	@qDescription	varchar(30),
	
	
	AS
	BEGIN
	SET NOCOUNT ON
		
		
		INSERT INTO dbo.[p-Question](
			[Type],[Text],Description
		)
		VALUES(
			@qType, @qText, @qDescription	
		)
		
		if(@qType=1){
		
		
		}
END
GO