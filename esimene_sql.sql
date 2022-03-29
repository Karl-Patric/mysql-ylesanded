SELECT * FROM d110079sd465665.orders;
SELECT * FROM books WHERE release_date >= 2010 AND type = 'new';
SELECT title, release_date, price, type FROM books WHERE release_date < 1970 AND type= 'used' AND price < 20 ;
SELECT count(*) AS "Tellimuste arv" , YEAR (order_date) AS Aasta FROM orders GROUP BY YEAR(order_date);
SELECT ROUND(SUM(price),2) AS "Ümardatud" FROM orders LEFT JOIN books ON orders.book_id = books.id GROUP BY YEAR(order_date);
SELECT SUM(price), COUNT(*) FROM orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017;
SELECT SUM(price), COUNT(*), username FROM clients LEFT JOIN orders ON orders.client_id = clients.id LEFT JOIN books ON orders.book_id= books.id WHERE YEAR (order_date) = 2017 GROUP BY client_id;
SELECT COUNT(*) FROM orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017 GROUP BY books.id ORDER BY count(*) desC LIMIT 10;
SELECT * FROM books WHERE price > ALL(SELECT avg(price) FROM books);