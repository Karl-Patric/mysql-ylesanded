SELECT * FROM d110072_raamatud.books WHERE release_date % 2 = 0;
SELECT count(*), language FROM d110072_raamatud.books GROUP BY language ORDER BY count(*) desc LIMIT 3;
INSERT INTO clients ( username, first_name, last_name, email, address)
Values ("epsu", "Evert", "Kärp", "evert.karp@ametikool.ee", "Tehnika 1-64");
UPDATE books SET language = "Eesti" WHERE id = 1;
DELETE FROM orders WHERE id = 2300;
INSERT INTO clients ( username, first_name, last_name, email, address)
values
("jams", "Mark", "Neer", "markk@gmail.com", "Noorsoo"),
("ramos", "Valdis", "Joss", "valdisj@gmail.com", "paldisk"),
("juur", "Raido", "Libe", "liberaido@gmail.com", "pikk"),
("naos", "Toomas", "Tuurik", "tuurikt@gmail.com", "kevade"),
("pensora", "Roomet", "Rool", "roometr@gmail.com", "smuuli");
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES
("5423 Juhan Smuuli", "2017-9-11", "sent",
(SELECT id FROM d110072_raamatud.clients WHERE username = "mcage1o"),
(SELECT id FROM d110072_raamatud.books WHERE title = "Vendetta"));
UPDATE d110072_raamatud.books
set price = price * 1.05, pages = pages - 5  where id > 0;
DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL);
