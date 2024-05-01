SELECT properties.city, count(reservations) as total_reservations
FROM reservations
JOIN properties ON properties.id = property_id
GROUP BY properties.city
ORDER BY count(reservations) DESC;
         city         | total_reservations 
----------------------+--------------------
 Carcross             |                409
 Town of Hay River    |                401
 Whitehorse           |                342
 Town of Inuvik       |                313
 Yellowknife          |                248
 Cornwall             |                176
 Souris               |                160
 Alberton             |                137
 Paradise             |                131
  (251 rows)