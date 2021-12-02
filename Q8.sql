CREATE PROCEDURE dbo.Q8 @logedInUsername varchar(30),
@maximum int OUTPUT AS BEGIN
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
    @maximum = (
        SELECT
            MAX(CountQuery.QuestionCount)
        FROM
            (
                SELECT
                    [p-Includes].QuestionID,
                    COUNT([p-Includes].QuestionID) as QuestionCount
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
                    [p-Includes].QuestionID
            ) AS CountQuery
    )
SELECT
    *
FROM
    (
        SELECT
            [p-Includes].QuestionID,
            COUNT([p-Includes].QuestionID) as QuestionCount
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
            [p-Includes].QuestionID
    ) AS CountQuery
WHERE
    CountQuery.QuestionCount > @maximum
END RETURN