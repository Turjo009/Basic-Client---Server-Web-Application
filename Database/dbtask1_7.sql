CREATE DATABASE dbtask1_7;

USE dbtask1_7;

CREATE TABLE Messages(
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(50),
    content VARCHAR(300)
);

INSERT INTO Messages (book_name, content) VALUES('Demo Book Name', 'Demo Message');
