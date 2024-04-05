SELECT pizzeria.name, count(*) AS count_of_orders, round(AVG(menu.price)) AS average_price, MAX(menu.price) AS max_price, MIN(menu.price) AS min_price
FROM person_order 
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1;