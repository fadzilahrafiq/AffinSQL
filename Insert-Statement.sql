CREATE TABLE IF NOT EXISTS `yougrocer`.`inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NOT NULL,
  `item_name` VARCHAR(255) NULL,
  `item_category` VARCHAR(255) NULL,
  `expiry_date` DATETIME NULL,
  PRIMARY KEY (`id`)
);

SET @JSONDATA = '{"itemList":[{"id":"1","item_cat":"Vegetable","item_name":"Tomato","expiry_date":"2024-06-30T09:16:01"},{"id":"2","item_cat":"Vegetable","item_name":"Onion","expiry_date":"2024-05-27T09:16:01"},{"id":"3","item_cat":"Vegetable","item_name":"Cucumber","expiry_date":"2024-03-30T09:16:01"},{"id":"4","item_cat":"Vegetable","item_name":"Brocolli","expiry_date":"2024-07-30T09:16:01"},{"id":"5","item_cat":"Vegetable","item_name":"Bell Pepper","expiry_date":"2023-10-30T09:16:01"},{"id":"6","item_cat":"Vegetable","item_name":"Chili","expiry_date":"2024-07-30T09:16:01"},{"id":"7","item_cat":"Vegetable","item_name":"Celery","expiry_date":"2023-09-30T09:16:01"},{"id":"8","item_cat":"Vegetable","item_name":"Potato","expiry_date":"2023-11-30T09:16:01"},{"id":"9","item_cat":"Fruit","item_name":"Orange","expiry_date":"2024-06-30T09:16:01"},{"id":"10","item_cat":"Fruit","item_name":"Apple","expiry_date":"2023-10-30T09:16:01"},{"id":"11","item_cat":"Fruit","item_name":"Pear","expiry_date":"2023-12-30T09:16:01"},{"id":"12","item_cat":"Fruit","item_name":"Watermelon","expiry_date":"2023-10-30T09:16:01"},{"id":"13","item_cat":"Fruit","item_name":"Plum","expiry_date":"2023-12-30T09:16:01"},{"id":"14","item_cat":"Fruit","item_name":"Lemon","expiry_date":"2023-12-30T09:16:01"},{"id":"15","item_cat":"Fruit","item_name":"Peach","expiry_date":"2024-01-30T09:16:01"},{"id":"16","item_cat":"Fruit","item_name":"Cherry","expiry_date":"2024-03-30T09:16:01"},{"id":"17","item_cat":"Fruit","item_name":"Grapes","expiry_date":"2023-01-30T09:16:01"},{"id":"18","item_cat":"Seafood","item_name":"Crab","expiry_date":"2024-03-30T09:16:01"},{"id":"19","item_cat":"Seafood","item_name":"Shrimp","expiry_date":"2024-09-30T09:16:01"},{"id":"20","item_cat":"Seafood","item_name":"Lobster","expiry_date":"2025-03-30T09:16:01"},{"id":"21","item_cat":"Seafood","item_name":"Oyster","expiry_date":"2023-10-30T09:16:01"},{"id":"22","item_cat":"Seafood","item_name":"Squid","expiry_date":"2024-6-30T09:16:01"},{"id":"23","item_cat":"Seafood","item_name":"Bass","expiry_date":"2024-02-27T09:16:01"},{"id":"24","item_cat":"Seafood","item_name":"Salmon","expiry_date":"2024-01-30T09:16:01"},{"id":"25","item_cat":"Seafood","item_name":"Tuna","expiry_date":"2024-01-30T09:16:01"},{"id":"26","item_cat":"Meat","item_name":"Lamb Chop","expiry_date":"2023-12-30T09:16:01"},{"id":"27","item_cat":"Meat","item_name":"Sirloin","expiry_date":"2025-12-30T09:16:01"},{"id":"28","item_cat":"Meat","item_name":"Dice Beef","expiry_date":"2024-03-30T09:16:01"},{"id":"29","item_cat":"Meat","item_name":"Chicken","expiry_date":"2024-05-30T09:16:01"},{"id":"30","item_cat":"Meat","item_name":"Salami","expiry_date":"2025-01-30T09:16:01"},{"id":"31","item_cat":"Meat","item_name":"Sausages","expiry_date":"2025-01-30T09:16:01"}]}';

INSERT INTO `yougrocer`.`inventory` (item_id, item_category, item_name, expiry_date)
SELECT j.id, j.item_cat, j.item_name, STR_TO_DATE(REPLACE(j.expiry_date, 'T', ' '), '%Y-%m-%d %H:%i:%s')
FROM JSON_TABLE(@JSONDATA,  '$.itemList[*]' 
  COLUMNS (
    id INT PATH '$.id',
    item_cat VARCHAR(255) PATH '$.item_cat',
    item_name VARCHAR(255) PATH '$.item_name',
    expiry_date VARCHAR(255) PATH '$.expiry_date'
  )
) AS j;
