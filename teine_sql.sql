SELECT * FROM d110079sd465665.orders;
SELECT sum(stock_saldo*price) FROM books;
SELECT MIN(price) AS Kõige_odavam, MAX(price) AS Kõige_kallim, AVG(price) AS Keskmine FROM books;
SELECT MAX(price) AS Kõige_kallim, from books WHERE type 'used';
SELECT CASE WHEN type = "new" THEN "uus" WHEN type = "used" THEN "kasutatud" WHEN type = "ebook" THEN "e-raamat" END as tüüp, round(avg(price),2) as Keskmine_Hind, COUNT(*) As Hulk FROM books GROUP BY type;
SELECT * FROM books WHERE type = "used" AND price > (SELECT avg(price) FROM books WHERE type = 'new');
SELECT * FROM books WHERE price > (SELECT avg(price) FROM authors
LEFT JOIN book_authors ON books.id = book_authors.author_id = authors_id
LEFT JOIN books ON books_id = book_authors.book_id 
LEFT JOIN orders ON orders.book_id = book.id 
GROUP BY authors.id ORDER BY count(*) desc LIMIT 1);
SELECT * FROM books WHERE release_date % 2 = 0;
SELECT count(*), language FROM books GROUP BY language ORDER BY count(*) desc LIMIT 3;