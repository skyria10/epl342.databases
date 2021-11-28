-- Must check for version
CREATE PROCEDURE q7 @currentUserID int AS -- body of the stored procedure
DECLARE @counter INT
SELECT
    *
FROM
    (
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
    ) AS CountQuery
ORDER BY
    CountQuery.#Questions ASC    
GO
;