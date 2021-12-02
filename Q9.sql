CREATE PROCEDURE dbo.Q9 @logedInUsername varchar(30) AS BEGIN
SET
	NOCOUNT ON DECLARE @company int
SET
	@company = (
		SELECT
			[p-Users].WorksFor
		FROM
			dbo.[p-Users]
		WHERE
			Username = @logedInUsername
	)
SELECT
	dbo.[p-Questionnaire].Title,
	CountQuery.QuestionnaireID,
	COUNT(CountQuery.QuestionnaireID)
FROM
	(
		SELECT
			MyQuestionnaires.QuestionnaireID
		FROM
			(
				SELECT
					dbo.[p-Questionnaire].QuestionnaireID
				FROM
					dbo.[p-Users],
					dbo.[p-Questionnaire]
				WHERE
					dbo.[p-Questionnaire].CreatedBy = dbo.[p-Users].UserID
					AND dbo.[p-Users].WorksFor = @company
			) AS MyQuestionnaires,
			dbo.[p-Includes]
		WHERE
			[p-Includes].QuestionnaireID = MyQuestionnaires.QuestionnaireID
	) AS CountQuery,
	dbo.[p-Questionnaire]
WHERE
	CountQuery.QuestionnaireID = dbo.[p-Questionnaire].QuestionnaireID
GROUP BY
	CountQuery.QuestionnaireID,
	[p-Questionnaire].Title
END
GO