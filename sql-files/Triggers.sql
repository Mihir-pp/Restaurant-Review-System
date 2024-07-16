use restro;
CREATE TRIGGER UpdateTotalRatings
ON reviews
AFTER INSERT
AS
BEGIN
    -- Update the total_ratings in the ratings table
    UPDATE r
    SET r.total_ratings = r.total_ratings + 1
    FROM ratings r
    INNER JOIN inserted i ON r.restaurant_id = i.restaurant_id;
END;
GO


CREATE TRIGGER UpdateTotalScore
ON reviews
AFTER INSERT
AS
BEGIN
    -- Update total_score in the ratings table
    UPDATE r
    SET r.total_score = (
        SELECT AVG(CAST(rating AS FLOAT))
        FROM reviews
        WHERE restaurant_id = r.restaurant_id
    )
    FROM ratings r
    WHERE r.restaurant_id IN (SELECT restaurant_id FROM inserted);
END;
