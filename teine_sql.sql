SELECT * FROM d110079_raamatud.books WHERE price > ALL(SELECT avg(price) FROM books);
SELECT sum(stock_saldo*price) FROM d110079_raamatud.books;
SELECT  min(price) as koige_odavam, max(price) as koige_kallim, avg(price) as keskmine_hind from d110079_raamatud.books;
SELECT max(price) as koige_kallim FROM d110079_raamatud.books WHERE type = "used";
SELECT CASE when type = "new" then "uus"  WHEN type = "used" then "kasutatud" WHEN type = "ebook" then "eraamat" END as Tüüp, round(avg(price),2) as Keskmine_hind, COUNT(*) as HULK FROM d110079_raamatud.books GROUP BY type;
SELECT * FROM d110079_raamatud.books WHERE type = "used" AND price > (SELECT avg(price) FROM d110079_raamatud.books WHERE type = "new" );
SELECT * FROM d110079_raamatud.books WHERE price > (SELECT avg(price) FROM d110079_raamatud.authors LEFT JOIN book_authors ON book_authors.author_id = authors.id LEFT JOIN books ON books.id  = book_authors.book_id LEFT JOIN orders ON orders.book_id = books.id GROUP BY authors.id ORDER BY count(*) desc LIMIT 1);
