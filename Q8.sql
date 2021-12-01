CREATE PROCEDURE dbo.Q1
	
	@logedInUser 	varchar(30)
	
	AS
	BEGIN
		SET NOCOUNT ON
		
		
		DECLARE @company int
		SELECT @company = WorksFor 
						FROM dbo.[p-User]
						WHERE Username=@logedInUser
		
		CREATE TABLE #TEMP (QID INT)
		
		INSERT INTO #TEMP VALUES(
		SELECT  QuestionnaireID 
		FROM 	dbo.[p-Questionnaire] INNER JOIN dbo.[p-Users] 
		ON dbo.[p-Questionnaire].CreatedBy=dbo.[p-Users].UserID 
		WHERE 	dbo.[p-Users].WorksFor=@company
		)
		
		
		
		
		
		SELECT *
		FROM (
			SELECT  COUNT(QuestionnaireID) AS QuestionCount, QuestionID  
			FROM  dbo.[p-Includes] INNER JOIN #TEMP 
			ON dbo.[p-Includes].QuestionnaireID=#TEMP.QID
			GROUP BY QuestionID
			ORDER BY QuestionCount DESC
		) AS CountQuery,dbo.[p-Question]
		WHERE dbo.[p-Question].QuestionID=CountQuery.QuestionID AND
				QuestionCount=

		DECLARE @maxVal int
		
		SELECT @maxVal=MAX(QuestionCount)
		FROM (
			SELECT  COUNT(QuestionnaireID) AS QuestionCount, QuestionID  
			FROM  dbo.[p-Includes] INNER JOIN #TEMP 
			ON dbo.[p-Includes].QuestionnaireID=#TEMP.QID
			GROUP BY QuestionID
		) 
	
		SELECT dbo.[p-Question].Text
		FROM dbo.[p-Question], dbo.[p-Includes]
		WHERE @maxVal
			
	dbo.[p-Question].Text
		
END
GO