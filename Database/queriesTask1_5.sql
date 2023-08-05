SELECT Books.title, Books.author, Orders.date_of_purchase
FROM Orders
INNER JOIN Users ON Users.user_id = Orders.user_id
INNER JOIN SellerBooks ON Orders.seller_book_id = SellerBooks.seller_book_id
INNER JOIN Books ON SellerBooks.ISBN = Books.ISBN
WHERE Users.username = "Jane"
AND Orders.date_of_purchase >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY Orders.date_of_purchase DESC;


--Note that i have assumed that the username is Jane, You can replace the name
--with any username to get the result for that specific user.

-- created some random entries of new orders:
-- INSERT INTO Orders (date_of_purchase, user_id, seller_book_id) VALUES
--   (CURDATE(), 2, 1),
--   ('2023-04-15', 2, 2),
--   (CURDATE(), 2, 3);
-- created some more:
-- INSERT INTO Orders (date_of_purchase, user_id, seller_book_id) VALUES
--   (CURDATE(), 2, 3),
--   ('2023-04-15', 2, 3),
--   ('2023-05-01', 2, 3),
--   ('2023-04-11', 2, 1);

-- result got:
-- +----------------+-----------------+------------------+
-- | title          | author          | date_of_purchase |
-- +----------------+-----------------+------------------+
-- | Oliver Twist   | Charles Dickens | 2023-06-15       |
-- | Algorithm Boss | Dr Abdul Bari   | 2023-06-15       |
-- | Clean Code     | Soap            | 2023-06-15       |
-- | Clean Code     | Soap            | 2023-06-15       |
-- +----------------+-----------------+------------------+
-- 4 rows in set (0.00 sec)
