use restro;
go
CREATE OR ALTER PROCEDURE OpenRestaurants
    @p_specific_time VARCHAR(50)
AS
BEGIN
    SELECT r.rname, r.location
    FROM restaurants r
    WHERE @p_specific_time BETWEEN r.opening_hours AND r.closing_hours;
END;

EXECUTE OpenRestaurants '08:00 AM';