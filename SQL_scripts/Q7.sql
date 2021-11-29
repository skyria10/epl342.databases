-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
-- Create the stored procedure in the specified schema
CREATE PROCEDURE q7 @currentUserID int AS -- body of the stored procedure
SELECT
    [p-Questionnaire].Title,
    COUNT([p-Includes].QuestionID) AS [#Questions]
FROM
    [p-Questionnaire],
    [p-Includes]
WHERE
    [p-Questionnaire].CreatedBy = @currentUserID
    AND [p-Questionnaire].QuestionnaireID = [p-Includes].QuestionnaireID
GROUP BY
    [p-Includes].QuestionnaireID
GO;