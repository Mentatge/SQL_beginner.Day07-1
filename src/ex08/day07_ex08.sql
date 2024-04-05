SELECT person.address, pizzeria.name, count(*) AS count_of_orders
FROM person_order
JOIN person ON person.id = person_order.id
JOIN person_visits ON person_visits.id = person.id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY person.address, pizzeria.name
ORDER BY 1,2