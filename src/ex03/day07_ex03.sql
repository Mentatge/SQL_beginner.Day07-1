SELECT p1.name, COALESCE(p1.count, 0) + COALESCE(p2.count, 0) AS total_count
FROM (SELECT pizzeria.name, COUNT (*) AS count
	 FROM person_visits 
	 JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	 GROUP BY pizzeria.name
	 ) AS p1 
	 FULL JOIN(
	 SELECT pizzeria.name, COUNT (*) AS count
	 FROM person_order
	 JOIN menu ON menu.id = person_order.menu_id
	 JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
     GROUP BY pizzeria.name
	 ) AS p2 ON p1.name = p2.name
ORDER BY 2 DESC, 1 ASC
