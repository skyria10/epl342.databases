-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.minimumQuestions @company int,
@minimum int OUTPUT -- add more stored procedure parameters here
AS BEGIN -- body of the stored procedure
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
RETURN
GO