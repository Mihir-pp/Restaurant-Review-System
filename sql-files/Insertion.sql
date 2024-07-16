 use restro;
INSERT INTO restaurants (restaurant_id, rname, location, opening_hours, closing_hours)
VALUES
    (101, 'Restaurant A', 'Location A', '08:00 AM', '10:00 PM'),
    (102, 'Restaurant B', 'Location B', '07:30 AM', '09:30 PM'),
    (103, 'Restaurant C', 'Location C', '09:00 AM', '11:00 PM'),
    (104, 'Restaurant D', 'Location D', '08:30 AM', '10:30 PM'),
    (105, 'Restaurant E', 'Location E', '07:00 AM', '09:00 PM'),
    (106, 'Restaurant F', 'Location F', '08:45 AM', '10:45 PM'),
    (107, 'Restaurant G', 'Location G', '07:15 AM', '09:15 PM'),
    (108, 'Restaurant H', 'Location H', '08:15 AM', '10:15 PM'),
    (109, 'Restaurant I', 'Location I', '08:30 AM', '10:30 PM'),
    (110, 'Restaurant J', 'Location J', '08:00 AM', '10:00 PM');


INSERT INTO ratings (restaurant_id) values
(101),
(102),
(103),
(104),
(105),
(106),
(107),
(108),
(109),
(110);
UPDATE ratings SET total_ratings = 0;


INSERT INTO users(username,city) values('dhyan','Surat');
INSERT INTO users(username,city) values('Sanat','Jaipur');
INSERT INTO users(username,city) values('Mihir','Jalgaon');
INSERT INTO users(username,city) values('Omi','Ranchi');
INSERT INTO users(username,city) values('Akash','Bihar');

SELECT * FROM users;

INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date)
VALUES (1, 'dhyan',101,'Restaurant A',4,'Surat','Great food and service!',GETDATE());

INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date)
VALUES (2, 'Sanat',101,'Restaurant A',3,'Jaipur','Mediocre service',GETDATE());

INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date)
VALUES (3, 'Mihir',101,'Restaurant A',5,'Jalgaon','The pizza is best!!',GETDATE());

INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date)
VALUES (4, 'Omi',101,'Restaurant A',1,'Ranchi','Not good.',GETDATE());

INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date)
VALUES (5, 'Akash',101,'Restaurant A',3,'Bihar','bakwass khanna tha.',GETDATE());

SELECT * FROM reviews;
SELECT * FROM ratings;

update reviews set rname ='Restaurant B'  where username='Ayush';


Select rname,total_ratings from restaurants s inner join ratings r on s.restaurant_id = r.restaurant_id;

select * from restaurants;

SELECT TOP 1 r.rname, total_score FROM ratings ra INNER JOIN restaurants r ON ra.restaurant_id = r.restaurant_id ORDER BY ra.total_score DESC;