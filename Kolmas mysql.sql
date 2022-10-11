SELECT * FROM d110072_raamatud.books WHERE release_date % 2 = 0;
SELECT count(*), language FROM d110072_raamatud.books GROUP BY language ORDER BY count(*) desc LIMIT 3;
INSERT INTO clients ( username, first_name, last_name, email, address)
Values ("Patu", "Karl-Patric", "Rohi", "Karl-Patric.rohi@ametikool.ee", "Nõmpa küla, männiku talu");
UPDATE books SET language = "Eesti" WHERE id = 1;
DELETE FROM orders WHERE id = 2300;
INSERT INTO clients ( username, first_name, last_name, email, address)
values
("Ants", "Anti", "Nuga", "AntiN@gmail.com", "Vändi 2"),
("Kari", "Mari", "Kala", "KalaMari@gmail.com", "Vändi 3"),
("Lipsu", "Lible", "Toom", "LibleToom@gmail.com", "Vändi 4"),
("Tom", "Tommy", "Koomas", "KoomasTom@gmail.com", "Vändi 5"),
("And", "Andis", "Nuga", "NugaAnd@gmail.com", "Vändi 6");
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES
("4200 Vändise Vändra", "2002-2-5", "sent",
(SELECT id FROM d110072_raamatud.clients WHERE username = "mcage1o"),
(SELECT id FROM d110072_raamatud.books WHERE title = "Vendetta"));
UPDATE d110072_raamatud.books
set price = price * 1.05, pages = pages - 5  where id > 0;
DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL);
