CREATE DATABASE dbtask1_4;

USE dbtask1_4;

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  pass VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE Books (
  ISBN VARCHAR(13) PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(100)
);

CREATE TABLE Sellers (
  seller_id INT AUTO_INCREMENT PRIMARY KEY,
  seller_location VARCHAR(50)
);

CREATE TABLE SellerBooks (
  seller_book_id INT AUTO_INCREMENT PRIMARY KEY,
  ISBN VARCHAR(13),
  seller_id INT,
  price INT,
  FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id) ON DELETE CASCADE,
  FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON DELETE CASCADE
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  date_of_purchase DATE,
  user_id INT,
  seller_book_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (seller_book_id) REFERENCES SellerBooks(seller_book_id) ON DELETE CASCADE
);


INSERT INTO Users (username, pass, email) VALUES
  ('Bob', 'password123', 'bob@example.com'),
  ('Jane', 'abc123', 'jane@example.com'),
  ('Mike', 'pass123', 'mike@example.com');

INSERT INTO Books (ISBN, title, author) VALUES
  ('9783161484100', 'Algorithm Boss', 'Dr Abdul Bari'),
  ('9780133594140', 'Oliver Twist', 'Charles Dickens'),
  ('9780321122264', 'Clean Code', 'Soap');

INSERT INTO Sellers (seller_location) VALUES
  ('India'),
  ('London'),
  ('Bangladesh');

INSERT INTO SellerBooks (ISBN, seller_id, price) VALUES
  ('9783161484100', 1, 300),
  ('9780133594140', 2, 100),
  ('9780321122264', 3, 250);

INSERT INTO Orders (date_of_purchase, user_id, seller_book_id) VALUES
  (CURDATE(), 1, 1),
  (CURDATE(), 2, 2),
  (CURDATE(), 3, 3);