CREATE PROCEDURE dbo.Q10 @logedInUsername varchar(30) AS BEGIN
SET
    NOCOUNT ON DECLARE @company int
SET
    @company = (
        SELECT
            Manages
        FROM
            dbo.[p-Users]
        WHERE
            Username = @logedInUsername
    ) 
DECLARE @average int
SET
    @average = (
        SELECT
            AVG(CountQuery.QuestionCount)
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
                            AND dbo.[p-Users].WorksFor = @company
                    ) AS MyQuestionnaires,
                    [p-Includes]
                WHERE
                    [p-Includes].QuestionnaireID = MyQuestionnaires.QuestionnaireID
                GROUP BY
                    MyQuestionnaires.QuestionnaireID
            ) AS CountQuery
    )



END RETURN
GO