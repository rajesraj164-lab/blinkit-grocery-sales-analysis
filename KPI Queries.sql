-- KPI 1: Total Sales Revenue
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM blinkit;
-- KPI 2: Average Sales per item
SELECT ROUND(AVG(Sales), 2) AS avg_sales
FROM blinkit;

-- KPI 3: Average customer rating
SELECT ROUND(AVG(Rating), 2) AS avg_rating
FROM blinkit;

-- KPI 4: Total number of items
SELECT COUNT(*) AS total_items FROM blinkit;

-- Q1: Sales by Fat Content — do customers prefer Low Fat?
SELECT "Item Fat Content",
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count,
       ROUND(AVG(Rating), 2) AS avg_rating
FROM blinkit
GROUP BY "Item Fat Content";

-- Q2: Which item types generate the most revenue?
SELECT "Item Type",
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count
FROM blinkit
GROUP BY "Item Type"
ORDER BY total_sales DESC;

-- Q3: Sales performance by outlet size
SELECT "Outlet Size",
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS outlet_count,
       ROUND(AVG(Sales), 2) AS avg_sales_per_item
FROM blinkit
GROUP BY "Outlet Size"
ORDER BY total_sales DESC;

-- Q4: Which location tier performs best?
SELECT "Outlet Location Type",
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(AVG(Rating), 2) AS avg_rating
FROM blinkit
GROUP BY "Outlet Location Type"
ORDER BY total_sales DESC;

-- Q5: Sales by outlet type
SELECT "Outlet Type",
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count,
       ROUND(AVG(Sales), 2) AS avg_sales
FROM blinkit
GROUP BY "Outlet Type"
ORDER BY total_sales DESC;

-- Q6: Top 10 highest selling items by MRP range
SELECT
  CASE
    WHEN Sales < 50 THEN 'Budget (Under 50)'
    WHEN Sales BETWEEN 50 AND 100 THEN 'Mid (50-100)'
    WHEN Sales BETWEEN 100 AND 200 THEN 'Premium (100-200)'
    ELSE 'Luxury (200+)'
  END AS price_range,
  COUNT(*) AS item_count,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(AVG(Rating), 2) AS avg_rating
FROM blinkit
GROUP BY price_range
ORDER BY total_sales DESC;

-- Q7: Best performing outlet type + location combo
SELECT "Outlet Type", "Outlet Location Type",
       ROUND(SUM(Sales), 2) AS total_sales
FROM blinkit
GROUP BY "Outlet Type", "Outlet Location Type"
ORDER BY total_sales DESC
LIMIT 10;