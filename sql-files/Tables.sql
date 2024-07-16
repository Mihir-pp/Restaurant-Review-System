use restro;
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    rname VARCHAR(100),
    location VARCHAR(100),
    opening_hours VARCHAR(50),
	closing_hours VARCHAR(50)
);

CREATE TABLE users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE,
	city varchar(100)
);

CREATE TABLE reviews (
	review_id INT IDENTITY(0,1) PRIMARY KEY,
    user_id INT,
    username VARCHAR(50),
    restaurant_id INT,
    rname VARCHAR(100),
    rating INT,
    city VARCHAR(100),
    review_text NVARCHAR(MAX),
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES users (UserID),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

CREATE TABLE ratings (
    restaurant_id INT PRIMARY KEY,
    total_ratings INT,
    total_score INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

ALTER TABLE ratings
ALTER COLUMN total_score FLOAT;
