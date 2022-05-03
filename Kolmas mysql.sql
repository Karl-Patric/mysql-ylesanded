
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES ("patr1c", "Karl-Patric", "Rohi", "Karl-Patric.rohi@ametikool.ee", "Nõmpa küla Männiku talu");
UPDATE books
SET language = "Eesti"
WHERE id = 1;
DELETE FROM orders
WHERE id = 2300;
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES 
("Pets", "Peeter", "Silo", "PetsSilo@gmail.com", "Silomaa"),
("Ants", "Anti", "Nuga", "AntiNuga@gmail.com", "Antsumaa"),
("Kalts", "Mari", "Kala", "KalaMari@gmail.com", "Kalamaa"),
("Susi", "Marko", "Suslik", "Suslik@gmail.com", "Susimaa"),
("Anjusha", "Anna", "Minna", "keriis@gmail.com", "Andisminna");
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES
("2323 Chinook Plaza", "2018-12-13", "sent",
(SELECT id FROM d107230_leopard.clients WHERE username = "mcage1o"),
(SELECT id FROM d107230_leopard.books WHERE title = "Vendetta"));
UPDATE d107230_leopard.books
set price = price * 1.05, pages = pages - 5  where id > 0;
DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL);