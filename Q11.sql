CREATE PROCEDURE dbo.Q10 @logedInUsername varchar(30),
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
    )


END RETURN