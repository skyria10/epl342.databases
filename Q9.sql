CREATE PROCEDURE dbo.Q9

	@logedInUsername varchar(30)
	
	AS
	BEGIN
	SET NOCOUNT ON
		
		DECLARE 	@company int
					SELECT @company Manages 
					FROM dbo.[p-User]
					WHERE Username=@logedInUsername
					
		SELECT CountQuery.CountQ, dbo.[p-Questionnaire].Title, dbo.[p-Questionnaire].Version
		FROM(
			SELECT COUNT(MyQuestionnaires.QuestionnaireID) AS CountQ,MyQuestionnaires.QuestionnaireID
			FROM (
				SELECT dbo.[p-Questionnaire].QuestionnaireID
				FROM dbo.[p-User], dbo.[p-Questionnaire]
				WHERE dbo.[p-Questionnaire].CreatedBy = dbo.[p-User].UserID AND dbo.[p-User].WorksFor = @company
				)AS MyQuestionnaires, dbo.[p-Includes]
			)AS CountQuery, dbo.[p-Questionnaire]
		WHERE 	CountQuery.QuestionnaireID = dbo.[p-Questionnaire].QuestionnaireID
			
						
		
	
END
GO