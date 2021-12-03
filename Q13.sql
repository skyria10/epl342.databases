CREATE PROCEDURE dbo.Q13 @logedInUsername VARCHAR -- add more stored procedure parameters here
AS BEGIN
SET
    NOCOUNT ON DECLARE @company int
SET
    @company = (
        SELECT
            [p-Users].WorksFor
        FROM
            dbo.[p-Users]
        WHERE
            [p-Users].Username = @logedInUsername
    ) -- body of the stored procedure
SELECT
    [p-Includes].QuestionnaireID, [p-Includes].QuestionID 
FROM
    (
        SELECT
            [p-Questionnaire].QuestionnaireID
        FROM
            [p-Users],
            [p-Questionnaire]
        WHERE
			[p-Questionnaire].CreatedBy = [p-Users].UserID 
			AND [p-Users].WorksFor = @company
            AND [p-Questionnaire].URL IS NOT NULL
    ) as MyQueries,
    [p-Includes]
WHERE [p-Includes].QuestionnaireID = MyQueries.QuestionnaireID
GROUP BY [p-Includes].QuestionnaireID, [p-Includes].QuestionID    
END
RETURN @company