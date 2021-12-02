CREATE PROCEDURE dbo.countQuestions @company int AS BEGIN
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
END
GO