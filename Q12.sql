CREATE PROCEDURE dbo.Q12 @logedInUsername VARCHAR -- add more stored procedure parameters here
AS BEGIN
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
    )
SET
    NOCOUNT ON DECLARE @minimum int
SET
    @minimum =(
        SELECT
            MIN(CountQuery.QuestionCount)
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



END
GO