--1
SELECT p.product_name, p.units_in_stock
FROM products p
WHERE p.units_in_stock < (
    SELECT MIN(avg_quantity)
    FROM (
        SELECT AVG(od.quantity) AS avg_quantity
        FROM order_details od
        GROUP BY od.product_id
    ) AS avg_per_product
);

--2
SELECT DISTINCT product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_details
    GROUP BY product_id
    HAVING SUM(quantity) = 10
);
