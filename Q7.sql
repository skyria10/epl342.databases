-- Must check for version
CREATE PROCEDURE q7 @currentUserID int AS BEGIN -- body of the stored procedure
SELECT
    *
FROM
    (
        SELECT
            [p-Questionnaire].Title,
            COUNT([p-Includes].QuestionID) AS [#Questions],
            @counter
        FROM
            [p-Questionnaire],
            [p-Includes]
        WHERE
            [p-Questionnaire].CreatedBy = @currentUserID
            AND [p-Questionnaire].QuestionnaireID = [p-Includes].QuestionnaireID
        GROUP BY
            [p-Includes].QuestionnaireID DECLARE @counter INT DECLARE @vers INT
        SET
            @vers = (
                SELECT
                    parentID
                FROM
                    [p-Questionnaire]
            ) WHILE(@vers != null) BEGIN
        SET
            @vers = (
                SELECT
                    parentID
                FROM
                    [p-Questionnaire]
                WHERE
                    [p-Questionnaire].QuestionnaireID = @vers
            )
        SET
            @counter = @counter + 1
    END
) AS CountQuery
ORDER BY
    CountQuery.#Questions ASC
END
GO
;