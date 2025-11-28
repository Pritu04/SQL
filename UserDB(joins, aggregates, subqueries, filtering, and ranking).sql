Create Database UsersDB;
-- Create Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

-- Insert Users
INSERT INTO users (user_id, name, country, signup_date) VALUES
(1, 'Aniket', 'India', '2022-05-01'),
(2, 'Priya', 'USA', '2023-03-14'),
(3, 'Rohit', 'UK', '2021-11-20'),
(4, 'Sarah', 'Germany', '2022-07-18'),
(5, 'John', 'Brazil', '2023-01-09'),
(6, 'Amit', 'India', '2021-08-25'),
(7, 'Neha', 'Canada', '2022-10-30'),
(8, 'Carlos', 'Brazil', '2023-06-12'),
(9, 'Emma', 'Australia', '2021-02-17'),
(10, 'Liam', 'USA', '2022-12-05'),
(11, 'Olivia', 'UK', '2023-07-20'),
(12, 'Sophia', 'Germany', '2022-11-11'),
(13, 'Noah', 'India', '2021-09-14'),
(14, 'Mia', 'Canada', '2023-04-03'),
(15, 'Ethan', 'Australia', '2022-08-09'),
(16, 'Isabella', 'Brazil', '2021-06-28'),
(17, 'James', 'USA', '2022-03-17'),
(18, 'Aarav', 'India', '2023-05-23'),
(19, 'Zara', 'UK', '2022-01-19'),
(20, 'Leo', 'Germany', '2021-12-27');

-- Create Plays table
CREATE TABLE plays (
    play_id INT PRIMARY KEY,
    user_id INT,
    song VARCHAR(100),
    play_date DATE,
    device VARCHAR(50),
    duration_listened INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert Plays (60 sample records)
INSERT INTO plays (play_id, user_id, song, play_date, device, duration_listened) VALUES
(1, 1, 'Blinding Lights', '2023-04-05', 'Mobile', 180),
(2, 2, 'Shape of You', '2023-05-11', 'Desktop', 200),
(3, 3, 'Levitating', '2023-06-20', 'Tablet', 150),
(4, 4, 'Bad Guy', '2023-07-25', 'Smart Speaker', 175),
(5, 5, 'Peaches', '2023-08-12', 'Mobile', 210),
(6, 6, 'Stay', '2023-09-18', 'Desktop', 190),
(7, 7, 'Closer', '2023-10-22', 'Mobile', 240),
(8, 8, 'Senorita', '2023-11-01', 'Tablet', 165),
(9, 9, 'Perfect', '2023-12-09', 'Mobile', 200),
(10, 10, 'Believer', '2024-01-06', 'Desktop', 240),
(11, 11, 'Shape of You', '2024-01-15', 'Smart Speaker', 84),
(12, 12, 'Stay', '2023-09-28', 'Mobile', 177),
(13, 13, 'Blinding Lights', '2024-02-03', 'Tablet', 195),
(14, 14, 'Closer', '2023-08-17', 'Mobile', 215),
(15, 15, 'Senorita', '2023-06-22', 'Desktop', 174),
(16, 16, 'Perfect', '2023-07-29', 'Smart Speaker', 202),
(17, 17, 'Believer', '2024-03-10', 'Mobile', 220),
(18, 18, 'Levitating', '2023-05-27', 'Tablet', 188),
(19, 19, 'Shape of You', '2023-04-14', 'Desktop', 201),
(20, 20, 'Blinding Lights', '2024-02-11', 'Mobile', 203),
(21, 1, 'Closer', '2023-10-02', 'Mobile', 162),
(22, 2, 'Peaches', '2023-11-19', 'Tablet', 144),
(23, 3, 'Stay', '2024-01-26', 'Desktop', 199),
(24, 4, 'Perfect', '2023-07-13', 'Mobile', 172),
(25, 5, 'Believer', '2024-02-09', 'Smart Speaker', 230),
(26, 6, 'Shape of You', '2023-08-24', 'Mobile', 163),
(27, 7, 'Levitating', '2024-01-03', 'Desktop', 190),
(28, 8, 'Blinding Lights', '2023-06-09', 'Mobile', 185),
(29, 9, 'Senorita', '2024-02-15', 'Smart Speaker', 211),
(30, 10, 'Bad Guy', '2023-12-22', 'Tablet', 192),
(31, 11, 'Stay', '2023-05-18', 'Mobile', 220),
(32, 12, 'Perfect', '2024-01-29', 'Desktop', 180),
(33, 13, 'Closer', '2023-07-21', 'Smart Speaker', 175),
(34, 14, 'Shape of You', '2023-08-30', 'Tablet', 189),
(35, 15, 'Believer', '2024-03-03', 'Mobile', 210),
(36, 16, 'Peaches', '2023-09-14', 'Desktop', 150),
(37, 17, 'Levitating', '2023-11-05', 'Smart Speaker', 202),
(38, 18, 'Blinding Lights', '2023-06-18', 'Mobile', 195),
(39, 19, 'Stay', '2024-02-20', 'Desktop', 200),
(40, 20, 'Closer', '2023-07-27', 'Tablet', 170),
(41, 1, 'Bad Guy', '2023-08-16', 'Smart Speaker', 180),
(42, 2, 'Senorita', '2023-09-25', 'Mobile', 175),
(43, 3, 'Perfect', '2023-10-30', 'Desktop', 190),
(44, 4, 'Believer', '2023-11-12', 'Tablet', 185),
(45, 5, 'Shape of You', '2023-12-05', 'Smart Speaker', 200),
(46, 6, 'Levitating', '2024-01-18', 'Mobile', 160),
(47, 7, 'Stay', '2023-09-08', 'Desktop', 176),
(48, 8, 'Blinding Lights', '2023-06-21', 'Tablet', 189),
(49, 9, 'Peaches', '2024-02-23', 'Smart Speaker', 220),
(50, 10, 'Closer', '2023-07-19', 'Mobile', 168),
(51, 11, 'Bad Guy', '2023-08-27', 'Desktop', 190),
(52, 12, 'Perfect', '2024-01-08', 'Tablet', 202),
(53, 13, 'Believer', '2023-11-15', 'Smart Speaker', 210),
(54, 14, 'Shape of You', '2023-09-21', 'Mobile', 192),
(55, 15, 'Levitating', '2023-06-30', 'Desktop', 170),
(56, 16, 'Stay', '2023-10-10', 'Tablet', 178),
(57, 17, 'Closer', '2024-02-25', 'Mobile', 200),
(58, 18, 'Peaches', '2023-07-07', 'Desktop', 185),
(59, 19, 'Blinding Lights', '2023-08-14', 'Smart Speaker', 199),
(60, 20, 'Perfect', '2023-09-29', 'Mobile', 210);



-- 1. Basic Queries

-- 1.List all users from India:

SELECT * FROM users WHERE country = 'India';


-- 2.Show all plays on Mobile devices:

SELECT * FROM plays WHERE device = 'Mobile';

-- 2. Aggregate Functions

-- 1.Count total plays per user:

SELECT user_id, COUNT(*) AS total_plays
FROM plays
GROUP BY user_id;


-- Average duration listened per user:

SELECT user_id, AVG(duration_listened) AS avg_duration
FROM plays
GROUP BY user_id;


-- Total number of plays per song:

SELECT song, COUNT(*) AS play_count
FROM plays
GROUP BY song
ORDER BY play_count DESC;

-- 3. Join Queries

-- List each play with user name:

SELECT p.play_id, u.name, p.song, p.play_date, p.device
FROM plays p
JOIN users u ON p.user_id = u.user_id;


-- Total duration listened per user with user names:

SELECT u.name, SUM(p.duration_listened) AS total_duration
FROM plays p
JOIN users u ON p.user_id = u.user_id
GROUP BY u.name;

-- 4. Subqueries

-- Find users who played 'Blinding Lights':

SELECT * FROM users
WHERE user_id IN (
    SELECT user_id FROM plays WHERE song = 'Blinding Lights'
);


-- Find songs played by users from the USA:

SELECT DISTINCT song
FROM plays
WHERE user_id IN (
    SELECT user_id FROM users WHERE country = 'USA'
);

-- 5. Ranking and Window Functions

-- (if your SQL supports window functions)





-- 6. Filtering with Conditions

-- Plays longer than 200 seconds 

SELECT * FROM plays WHERE duration_listened > 200;


-- Users who signed up after Jan 1, 2023:

SELECT * FROM users WHERE signup_date > '2023-01-01';

-- 7. Advanced

-- Users who played all songs by a particular artist:

-- Example for 'Blinding Lights'
SELECT u.name
FROM users u
WHERE NOT EXISTS (
    SELECT 1
    FROM plays p
    WHERE p.song = 'Blinding Lights'
      AND p.user_id = u.user_id
);


-- Most popular device per user:

SELECT user_id, device, COUNT(*) AS device_count
FROM plays
GROUP BY user_id, device
ORDER BY user_id, device_count DESC;

-- 1. Retrieve all users from India who signed up after 2022-12-31
SELECT * 
FROM users
WHERE country = 'India'
  AND signup_date > '2022-12-31';

-- 2. Total number of plays and average duration listened per user
SELECT u.user_id, u.name, COUNT(p.play_id) AS total_plays, 
       AVG(p.duration_listened) AS avg_duration
FROM users u
LEFT JOIN plays p ON u.user_id = p.user_id
GROUP BY u.user_id, u.name;

-- 3. List all plays along with user’s name and country
SELECT p.play_id, p.song, p.play_date, p.device, p.duration_listened,
       u.name, u.country
FROM plays p
JOIN users u ON p.user_id = u.user_id;

-- 4. Names of users who have listened to 'Blinding Lights'
SELECT DISTINCT u.name
FROM users u
JOIN plays p ON u.user_id = p.user_id
WHERE p.song = 'Blinding Lights';

-- 5. Users who have listened to more than 5 songs
SELECT u.user_id, u.name, COUNT(p.play_id) AS play_count
FROM users u
JOIN plays p ON u.user_id = p.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(p.play_id) > 5;

-- 6. Top 3 most listened songs by total plays
SELECT song, COUNT(*) AS total_plays
FROM plays
GROUP BY song
ORDER BY total_plays DESC
LIMIT 3;

-- 7. All plays on Mobile devices for users from USA
SELECT p.play_id, p.song, p.play_date, p.duration_listened, u.name, u.country
FROM plays p
JOIN users u ON p.user_id = u.user_id
WHERE p.device = 'Mobile' AND u.country = 'USA';

-- 8. Songs played longer than user's average duration (correlated subquery)
SELECT p.user_id, p.song, p.duration_listened
FROM plays p
WHERE p.duration_listened > (
    SELECT AVG(p2.duration_listened)
    FROM plays p2
    WHERE p2.user_id = p.user_id
);

-- 9. Pairs of users from the same country (self join)
SELECT u1.name AS User1, u2.name AS User2, u1.country
FROM users u1
JOIN users u2 ON u1.country = u2.country AND u1.user_id < u2.user_id;

-- 10. For each user, the song with maximum duration listened
SELECT p.user_id, u.name, p.song, p.duration_listened
FROM plays p
JOIN users u ON p.user_id = u.user_id
WHERE (p.user_id, p.duration_listened) IN (
    SELECT user_id, MAX(duration_listened)
    FROM plays
    GROUP BY user_id
)
ORDER BY p.user_id;
