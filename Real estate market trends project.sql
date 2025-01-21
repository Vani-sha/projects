CREATE DATABASE real_estate;
USE real_estate;

CREATE TABLE properties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    property_type VARCHAR(50),  -- e.g., 'Single Family', 'Condo', 'Townhouse'
    price DECIMAL(10, 2),
    listing_date DATE,
    sale_date DATE,
    neighborhood VARCHAR(100),
    region VARCHAR(100),
    bedrooms INT,
    bathrooms INT,
    area INT,  -- in square feet
    status VARCHAR(20)  -- e.g., 'Sold', 'Active'
);
INSERT INTO properties (address, property_type, price, listing_date, sale_date, neighborhood, region, bedrooms, bathrooms, area, status) 
VALUES
('123 Maple St', 'Single Family', 350000, '2023-01-01', '2023-06-15', 'Downtown', 'City A', 3, 2, 1500, 'Sold'),
('456 Oak Ave', 'Condo', 250000, '2023-02-10', '2023-05-20', 'Uptown', 'City A', 2, 1, 800, 'Sold'),
('789 Pine Blvd', 'Townhouse', 300000, '2023-03-05', NULL, 'Suburb', 'City B', 3, 2, 1200, 'Active'),
('321 Elm St', 'Single Family', 450000, '2023-01-15', '2023-07-10', 'Downtown', 'City A', 4, 3, 1800, 'Sold'),
('654 Birch Rd', 'Condo', 270000, '2023-04-01', NULL, 'Uptown', 'City A', 2, 2, 900, 'Active'),
('987 Cedar Ln', 'Single Family', 500000, '2023-05-01', '2023-09-15', 'Suburb', 'City B', 5, 4, 2200, 'Sold');
SELECT YEAR(sale_date) AS year,
AVG(price) AS average_price
FROM properties
WHERE sale_date IS NOT NULL
GROUP BY YEAR(sale_date)
ORDER BY year;
SELECT property_type, COUNT(*) AS number_of_sales, AVG(price) AS average_price
FROM properties
WHERE status = 'Sold'
GROUP BY property_type
ORDER BY number_of_sales DESC;
SELECT MONTH(sale_date) AS month, COUNT(*) AS sales_count
FROM properties
WHERE sale_date IS NOT NULL
GROUP BY MONTH(sale_date)
ORDER BY month;
SELECT neighborhood, AVG(price) AS average_price
FROM properties
WHERE status = 'Sold'
GROUP BY neighborhood
ORDER BY average_price DESC;
SELECT YEAR(sale_date) AS year, region, COUNT(*) AS sales_volume
FROM properties
WHERE sale_date IS NOT NULL
GROUP BY YEAR(sale_date), region
ORDER BY year, sales_volume DESC;
SELECT AVG(DATEDIFF(sale_date, listing_date)) AS average_days_on_market
FROM properties
WHERE sale_date IS NOT NULL;
WITH Yearly_Avg AS (
    SELECT YEAR(sale_date) AS year, AVG(price) AS average_price
    FROM properties
    WHERE sale_date IS NOT NULL
    GROUP BY YEAR(sale_date)
)
SELECT current.year, ((current.average_price - previous.average_price) / previous.average_price) * 100 AS price_increase_percentage
FROM Yearly_Avg current
JOIN Yearly_Avg previous ON current.year = previous.year + 1
ORDER BY current.year;
SELECT 
    address, 
    price, 
    neighborhood
FROM 
    properties
ORDER BY 
    price DESC
LIMIT 10;
SELECT 
    YEAR(sale_date) AS year,
    property_type,
    AVG(price) AS average_price
FROM 
    properties
WHERE 
    sale_date IS NOT NULL
GROUP BY 
    YEAR(sale_date), property_type
ORDER BY 
    year, property_type;









