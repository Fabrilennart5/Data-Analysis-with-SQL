-- SQLite

-- Music Store Sales Analysis Project
-- Description: This project focuses on analyzing the database of the fictional music store Chinook to gain valuable insights into sales, customers, and employees.

-- Question 1:
-- Which are the five countries with the highest number of registered customers in the database?

SELECT
    Country,
    COUNT(CustomerId) as customer_count
FROM
    customers
GROUP BY
    Country
ORDER BY
    customer_count DESC
LIMIT
    5;

-- Question 2:
-- Which are the top five artists with the most albums in the database?

SELECT
    a.Name as Artist,
    COUNT(al.AlbumId) as album_count
FROM
    artists as a
    LEFT JOIN albums as al ON a.ArtistId = al.ArtistId
GROUP BY
    a.Name
ORDER BY
    album_count DESC
LIMIT
    5;

-- Question 3:
--  How many invoices have been issued per month, and how are those invoices distributed?

SELECT
    CASE strftime('%m', InvoiceDate)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
        ELSE ''
    END AS month,
    COUNT(InvoiceId) AS invoice_count
FROM
    invoices
GROUP BY
    month
ORDER BY
    month ASC;

-- Question 4:
-- Which are the five songs with the longest duration in minutes?

SELECT
    Name as song_name,
    ROUND((Milliseconds / 60000.0), 2) AS Duration_Minutes
FROM
    tracks
ORDER BY
    Duration_Minutes DESC
LIMIT
    5;

-- Question 5:
-- How many songs are there of each type of media in the database?

SELECT
    mt.Name as media_type,
    COUNT(tr.TrackId) as songs
FROM
    tracks as tr
    LEFT JOIN media_types mt ON tr.MediaTypeId = mt.MediaTypeId
GROUP BY
    mt.Name
ORDER BY
    songs DESC;
