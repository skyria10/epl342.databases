CREATE PROCEDURE dbo.Q11 @logedInUsername varchar(30),
@average int OUTPUT AS BEGIN
SET
    NOCOUNT ON DECLARE @company int
SET
    @company = (
        SELECT
            WorksFor
        FROM
            dbo.[p-Users]
        WHERE
            Username = @logedInUsername
    ) EXECUTE dbo.Q10 @logedInUsername,
    @average

SELECT
    CountQuery.QuestionnaireID
FROM
    (
        SELECT
            MyQuestionnaires.QuestionnaireID,
            COUNT(MyQuestionnaires.QuestionnaireID) as QuestionCount
        FROM
            (
                SELECT
                    dbo.[p-Questionnaire].QuestionnaireID
                FROM
                    dbo.[p-Users],
                    dbo.[p-Questionnaire]
                WHERE
                    dbo.[p-Questionnaire].CreatedBy = dbo.[p-Users].UserID
                    AND dbo.[p-Users].WorksFor = @company AND [p-Questionnaire].[URL] != NULL
            ) AS MyQuestionnaires,
            [p-Includes]
        WHERE
            [p-Includes].QuestionnaireID = MyQuestionnaires.QuestionnaireID
        GROUP BY
            MyQuestionnaires.QuestionnaireID
    ) AS CountQuery
    WHERE CountQuery.QuestionCount > @average



END RETURN