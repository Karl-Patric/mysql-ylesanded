SELECT * FROM d110079sd465665.orders;
-- yl.2
SELECT * FROM d107230_leopard.books WHERE  release_date >= 2010 AND type = 'new';
-- yl.3
SELECT title, release_date, price, type FROM books WHERE release_date < 1970 AND type= 'used' AND price < 20 ;
-- yl.4
SELECT count(*) AS "Tellimuste arv" , YEAR (order_date) AS Aasta FROM orders GROUP BY YEAR(order_date);
-- yl.5
SELECT ROUND(SUM(price),2) AS "Ümardatud" FROM orders LEFT JOIN books ON orders.book_id = books.id GROUP BY YEAR(order_date);
-- yl.6
SELECT SUM(price), COUNT(*) FROM orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017;
-- yl.7
SELECT SUM(price), COUNT(*), username FROM d107230_leopard.clients LEFT JOIN orders ON orders.client_id = clients.id LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017 GROUP BY client_id;
-- yl.8
SELECT COUNT(*) FROM d107230_leopard.orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017 GROUP BY books.id ORDER BY count(*) desc LIMIT 10;
-- yl.9
SELECT * FROM d107230_leopard.books WHERE price > ALL(SELECT avg(price) FROM books);





-- 22, -- yl.1
SELECT sum(stock_saldo*price) FROM d107230_leopard.books;
-- 22, -- yl.2
SELECT MIN(price) AS Kõige_odavam, MAX(price) AS Kõige_kallim, AVG(price) AS Keskmine FROM d107230_leopard.books;
-- 22, -- yl.3
SELECT max(price) AS Kõige_kallim FROM d107230_leopard.books WHERE type= 'used';
-- 22, -- yl.4
SELECT CASE WHEN type = "new" THEN "uus" WHEN type = "used" THEN "kasutatud" WHEN type = "ebook" THEN "e-raamat" END as Tüüp, round(avg(price),2) as Keskmine_Hind, COUNT(*) AS Hulk FROM d107230_leopard.books GROUP BY type;
-- 22, -- yl.5
SELECT * FROM d107230_leopard.books WHERE type = "used" AND price > (SELECT avg(price) FROM d107230_leopard.books WHERE type = 'new');
-- 22, -- yl.6
SELECT * FROM d107230_leopard.books WHERE price > (SELECT avg(price) FROM d107230_leopard.authors
LEFT JOIN book_authors ON book_authors.author_id = authors.id
LEFT JOIN books ON books.id  = book_authors.book_id  
LEFT JOIN orders ON orders.book_id = books.id 
GROUP BY authors.id ORDER BY count(*) desc LIMIT 1);
-- 22, -- yl.7
SELECT * FROM d107230_leopard.books WHERE release_date % 2 = 0; 
-- 22, -- yl.8
SELECT count(*), language FROM d107230_leopard.books GROUP BY language ORDER BY count(*) desc LIMIT 3;





-- 23, -- yl.1
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES ("patr1c", "Karl-Patric", "Rohi", "Karl-Patric.rohi@ametikool.ee", "Nõmpa küla Männiku talu");
-- 23, --yl.2
UPDATE books
SET language = "Eesti"
WHERE id = 1;
-- 23, -- yl.3
DELETE FROM orders
WHERE id = 2300;
-- 23, --yl.4
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES 
("Jooe", "Joonas", "Tamm", "kerip@gmail.com", "Paikuse"),
("Toos", "Valdur", "Kask", "kerip@gmail.com", "Paikuse"),
("Vokk", "Peeter", "Samm", "kerimm@gmail.com", "Laikuse"),
("Leo", "Tõnu", "Kuusk", "keri@gmail.com", "aikuse"),
("Hars", "Albert", "Oja", "keriis@gmail.com", "Taikuse");
-- 23, -yl.5
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES
("2323 Chinook Plaza", "2018-12-13", "sent",
(SELECT id FROM d107230_leopard.clients WHERE username = "mcage1o"),
(SELECT id FROM d107230_leopard.books WHERE title = "Vendetta"));
-- 23 -yl.6
UPDATE d107230_leopard.books
set price = price * 1.05, pages = pages - 5  where id > 0;
-- 23 -yl.7
DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL);
