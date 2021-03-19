--- exercice 1

SELECT CONCAT(emp_lastname,' ',emp_firstname), emp_children
FROM employees
ORDER BY  emp_children DESC, CONCAT(emp_lastname,' ',emp_firstname) ASC
LIMIT 4

--- exercice 2

SELECT cus_lastname, cus_firstname, cus_countries_id
FROM customers
WHERE cus_countries_id != 'FR' 
LIMIT 7

--- exercice 3

SELECT cus_city, cus_countries_id, cou_name 
FROM customers 
JOIN countries ON countries.cou_id = customers.cus_countries_id
ORDER BY cus_city ASC, cus_countries_id ASC

---exercice 4

SELECT cus_lastname, cus_update_date
FROM customers
WHERE cus_update_date IS NOT null

--- exercice 5

SELECT *
FROM customers
WHERE cus_city LIKE '%divos%'

--- exercice 6

SELECT pro_id, pro_name, pro_price   
FROM products
WHERE pro_price = (SELECT MIN(pro_price)
                   FROM products) 

--- exercice 7

SELECT DISTINCT pro_id, pro_ref, pro_name
from products
WHERE pro_id NOT IN (SELECT DISTINCT ode_pro_id
from orders_details)

--- exercice 8

SELECT pro_id, pro_ref, pro_name, cus_id, ord_id, ode_id
FROM products 
JOIN orders_details ON orders_details.ode_pro_id = products.pro_id
JOIN orders ON orders.ord_id = orders_details.ode_ord_id
JOIN customers ON customers.cus_id = orders.ord_cus_id
WHERE cus_lastname = 'pikatchien'

-- FROM table1
-- JOIN table2 on table2.id = table1.col_id
-- JOIN table3 on table3.id = table1.col_id2
-- JOIN table4 on table4.id = table2.col_id4

-- FROM table1, table2, table3
-- WHERE table2.id = table1.col_id AND table3.id = table1.col_id2

--- exercice 9

SELECT cat_id, cat_name, pro_name 
FROM categories 
JOIN products ON products.pro_cat_id = categories.cat_id 

---GROUP BY---

--- exercice 10

SELECT concat(employees.emp_lastname,' ',employees.emp_firstname)AS Employé, 
       concat(zebi.emp_lastname,' ',zebi.emp_firstname)AS Supérieur
FROM employees 
JOIN employees AS zebi
ON employees.emp_superior_id = superior.emp_id

---incomplet---

--- exercice 11

SELECT pro_id
FROM products JOIN orders_details
ON pro_id = ode_pro_id
ORDER BY ode_discount DESC
LIMIT 1

--- exercice 13

SELECT COUNT(cus_countries_id) AS 'Nb clients Canada'
FROM customers
WHERE cus_countries_id = 'ca'


--- exercice 14

SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date
FROM orders_details 
JOIN orders ON orders.ord_id = orders_details.ode_ord_id 
WHERE ord_order_date LIKE '2020%'

--- exercice 15 
SELECT *
FROM suppliers
JOIN products ON products.pro_sup_id = suppliers.sup_id
GROUP BY sup_id

--- exercice 16

SELECT SUM(ode_unit_price)
FROM orders_details 
JOIN orders ON orders.ord_id = orders_details.ode_ord_id
WHERE ord_order_date LIKE '2020%'

--- exercice 17 

SELECT ord_id, cus_lastname, ord_order_date, SUM(ode_unit_price -(ode_unit_price*ode_discount/100))*ode_quantity AS total 
FROM orders
JOIN customers ON customers.cus_id = orders.ord_cus_id
JOIN orders_details ON orders_details.ode_ord_id = orders.ord_id
GROUP BY ord_id
ORDER BY total DESC

---incomplet---

--- exercice 18

SELECT ord_id, cus_lastname, ord_order_date, SUM(ode_quantity*ode_unit_price) AS total
FROM orders 
JOIN customers ON customers.cus_id = orders.ord_cus_id
JOIN orders_details ON orders_details.ode_ord_id = orders.ord_id
GROUP BY ord_id
ORDER BY total DESC
LIMIT 10

---incomplet---

--- exercice 19

UPDATE products 
SET pro_name = 'Camper', pro_price = pro_price * 0.9 
WHERE pro_ref = 'barb004' 

--- exercice 20 

UPDATE products
SET pro_price = pro_price * 1.011
WHERE pro_ref LIKE 'prs%'

--- exercice 21

DELETE FROM products
INNER JOIN orders_details ON products.pro_id = orders_details.ode_id
WHERE pro_cat_id = 9 





