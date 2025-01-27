CREATE DATABASE onlinebookstore;

USE onlinebookstore;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(100));
    
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2),
    publication_year YEAR,
	FOREIGN KEY (author_id) REFERENCES authors(author_id)); 
    
 CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,   
    book_id INT, 
    customer_name VARCHAR(100) NOT NULL, 
    order_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id));
    
INSERT INTO authors (author_name, country) VALUES ('peter','united states');
INSERT INTO authors (author_name, country) VALUES ('J.K.Rowling','united kingdom');
INSERT INTO authors (author_name, country) VALUES ('Richard','united kingdom');

INSERT INTO books (title, author_id, price, publication_year) VALUES ('Jaws',1,90.99,1974);
INSERT INTO books (title, author_id, price, publication_year) VALUES ('Harrypotter',2,99.99,2007);
INSERT INTO books (title, author_id, price, publication_year) VALUES ('Watership Down',3,80.99,1972);
    
INSERT INTO orders (book_id, customer_name, order_date) VALUES (1,'Jos','2024-02-15');
INSERT INTO orders (book_id, customer_name, order_date) VALUES (2,'Shon','2024-02-25');
INSERT INTO orders (book_id, customer_name, order_date) VALUES (3,'Marry','2024-02-24');  

SELECT * FROM books;

SELECT * FROM authors;

SELECT * FROM orders;

ALTER TABLE books
ADD COLUMN genre VARCHAR(50);

ALTER TABLE orders
ADD COLUMN quantity INT;

SELECT b.book_id,b.title,b.price,b.publication_year,
b.genre,a.author_name,a.country FROM books b
JOIN authors a ON b.author_id = a.author_id;

SELECT o.order_id,o.customer_name,o.order_date,o.quantity,
b.title AS book_title,b.price FROM orders o JOIN 
books b ON o.book_id = b.book_id;