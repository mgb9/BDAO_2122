--
-- DDL
--

-- create and populate tables

CREATE TABLE `categories` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

CREATE TABLE `products` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `category_id` mediumint(8) default NULL,
  `name` varchar(30) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `categories` (`name`) VALUES ("Clothing"),("Sports Equipment"),("Hardware"),("Christmas");


INSERT INTO `products` (`category_id`,`name`) VALUES (3,"Screws");
INSERT INTO `products` (`category_id`,`name`) VALUES (3,"Bricks");
INSERT INTO `products` (`category_id`,`name`) VALUES (2, "Footballs");
INSERT INTO `products` (`category_id`,`name`) VALUES (2, "Tennis Balls");
INSERT INTO `products` (`category_id`,`name`) VALUES (1, "Trousers");
INSERT INTO `products` (`category_id`,`name`) VALUES (1, "Shirts");
INSERT INTO `products` (`category_id`,`name`) VALUES (1, "Skirts");
INSERT INTO `products` (`category_id`,`name`) VALUES (NULL, "Ladies Shoes");
INSERT INTO `products` (`category_id`,`name`) VALUES (NULL, "Gents Shoes");


--
-- SQL Query
--

-- Products contains 9 rows
-- Categories contains 4 rows


-- example 1 - default join option - INNER JOIN, returns seven matching rows

-- SELECT * FROM `products` p JOIN `categories` c ON ( p.category_id = c.id );

-- example 2 - INNER JOIN - matches previous example

-- SELECT * FROM `products` p INNER JOIN `categories` c ON ( p.category_id = c.id );

-- example 3 - RIGHT JOIN - all rows from categories, with matching rows from products

-- SELECT * FROM `products` p RIGHT JOIN `categories` c ON (p.category_id = c.id);

-- example 4 - LEFT JOIN - all rows from products, with matching rows in categories

-- SELECT * FROM `products` p LEFT JOIN `categories` c ON (p.category_id = c.id);
