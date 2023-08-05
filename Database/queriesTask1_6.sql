-- making more sale of Clean Code whihc is seller Book id 3:
-- INSERT INTO Orders (date_of_purchase, user_id, seller_book_id) VALUES
--   (CURDATE(), 2, 3),
--   ('2023-04-15', 2, 3),
--   ('2023-05-01', 2, 3),
--   ('2023-04-11', 2, 1);

-- mysql> SELECT SellerBooks.seller_book_id, Books.title, Books.author
--     -> FROM Orders
--     -> INNER JOIN SellerBooks ON Orders.seller_book_id = SellerBooks.seller_book_id
--     -> INNER JOIN Books ON SellerBooks.ISBN = Books.ISBN
--     ->
--     -> ;
-- ERROR 1046 (3D000): No database selected
-- mysql> Use dbtask1_4
-- Reading table information for completion of table and column names
-- You can turn off this feature to get a quicker startup with -A

-- Database changed
-- mysql> SELECT SellerBooks.seller_book_id, Books.title, Books.author
--     -> FROM Orders
--     -> INNER JOIN SellerBooks ON Orders.seller_book_id = SellerBooks.seller_book_id
--     -> INNER JOIN Books ON SellerBooks.ISBN = Books.ISBN;
-- +----------------+----------------+-----------------+
-- | seller_book_id | title          | author          |
-- +----------------+----------------+-----------------+
-- |              2 | Oliver Twist   | Charles Dickens |
-- |              2 | Oliver Twist   | Charles Dickens |
-- |              3 | Clean Code     | Soap            |
-- |              3 | Clean Code     | Soap            |
-- |              3 | Clean Code     | Soap            |
-- |              3 | Clean Code     | Soap            |
-- |              3 | Clean Code     | Soap            |
-- |              1 | Algorithm Boss | Dr Abdul Bari   |
-- |              1 | Algorithm Boss | Dr Abdul Bari   |
-- |              1 | Algorithm Boss | Dr Abdul Bari   |
-- +----------------+----------------+-----------------+
-- 10 rows in set (0.00 sec)

-- test query:
SELECT Books.title, Books.author, COUNT(Orders.order_id) AS num_sold
FROM Orders
INNER JOIN SellerBooks ON Orders.seller_book_id = SellerBooks.seller_book_id
INNER JOIN Books ON SellerBooks.ISBN = Books.ISBN
GROUP BY Books.title, Books.author
ORDER BY num_sold DESC
LIMIT 10;

-- Thus got the resul:
-- +----------------+-----------------+----------+
-- | title          | author          | num_sold |
-- +----------------+-----------------+----------+
-- | Clean Code     | Soap            |        5 |
-- | Algorithm Boss | Dr Abdul Bari   |        3 |
-- | Oliver Twist   | Charles Dickens |        2 |
-- +----------------+-----------------+----------+
-- 3 rows in set (0.00 sec)