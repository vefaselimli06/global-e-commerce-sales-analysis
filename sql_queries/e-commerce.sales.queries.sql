
SELECT * FROM global_e_commerce;

-- Ümumi satış analizi
SELECT 
    order_date,
    COUNT(*) AS total_orders
FROM global_e_commerce
GROUP BY order_date
ORDER BY order_date;


-- Ən aktiv aylar
SELECT 
    to_char(order_date, 'mm'),
    COUNT(*) AS total_orders
FROM global_e_commerce
GROUP BY to_char(order_date, 'mm')
ORDER BY total_orders DESC;


-- Aylıq trend analizi
SELECT 
    to_char(order_date, 'mm'),
    to_char(order_date, 'yyyy'),
    COUNT(*) AS total_orders
FROM global_e_commerce
GROUP BY to_char(order_date, 'mm'),
    to_char(order_date, 'yyyy')
ORDER BY to_char(order_date, 'mm'),
    to_char(order_date, 'yyyy');



-- Ən güclü satış ili
SELECT 
    to_char(order_date, 'yyyy'),
    COUNT(*) AS total_orders
FROM global_e_commerce
GROUP BY to_char(order_date, 'yyyy')
ORDER BY total_orders DESC
FETCH FIRST 1 ROW ONLY;


-- Window Function ilə ranking
SELECT 
    to_char(order_date, 'mm'),
    COUNT(*) AS total_orders,
    RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS sales_rank
FROM global_e_commerce
GROUP BY to_char(order_date, 'mm');


-- Dashboard KPI sorğusu
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT to_char(order_date, 'yyyy')) AS total_years,
    COUNT(DISTINCT to_char(order_date, 'mm')) AS active_months
FROM global_e_commerce;


-- View yaratmaq
CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT 
    to_char(order_date, 'yyyy'),
    to_char(order_date, 'mm')
FROM global_e_commerce;



-- İllər üzrə growth analizi
SELECT 
    to_char(order_date, 'yyyy'),
    COUNT(*) AS total_orders
FROM global_e_commerce
GROUP BY to_char(order_date, 'yyyy')
ORDER BY to_char(order_date, 'yyyy');
