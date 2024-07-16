use restro;
go
--PL/SQL Procedure to Retrieve the Latest Review for a Specific Restaurant
CREATE OR ALTER PROCEDURE GetLatestRestaurantReview
    @p_restaurant_id INT
AS
BEGIN
    SELECT TOP 1 r.review_id, r.username, r.rating, r.review_text, r.review_date
    FROM reviews r
    WHERE r.restaurant_id = @p_restaurant_id
    ORDER BY r.review_date DESC;
END;

EXECUTE GetLatestRestaurantReview 101;