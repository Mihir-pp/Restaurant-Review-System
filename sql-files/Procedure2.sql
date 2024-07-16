use restro;

go
--PL/SQL Procedure to Find Users with the Most Reviews
CREATE OR ALTER PROCEDURE FindTopReviewers
AS
BEGIN
    SELECT TOP 1 WITH TIES u.username, COUNT(r.review_id) AS review_count
    FROM users u
    LEFT JOIN reviews r ON u.UserID = r.user_id
    GROUP BY u.username
    ORDER BY review_count DESC;
END;

EXECUTE FindTopReviewers;
