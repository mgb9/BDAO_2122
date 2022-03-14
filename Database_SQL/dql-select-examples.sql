--
-- DDL
--

-- create the order table, this is the data to demo

CREATE TABLE `orders` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `trans_date` TEXT default NULL,
  `product_id` mediumint default NULL,
  `category_id` mediumint default NULL,
  `price` varchar(100) default NULL,
  `county` varchar(50) default NULL,
  `customer_surname` varchar(255) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `date_of_birth` varchar(255),
  `newsletter` varchar(255) default NULL,
  `promo_code` varchar(255) default NULL,
  `date_of_sale` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("ante.",60,5,"14.70","Stirlingshire","Huber","Kermit","1962-11-23","1","","2020-06-22"),("eu",18,3,"0.10","Wigtownshire","Griffith","Hayden","1996-08-19","1","PROMO15","2020-06-30"),("non,",21,3,"77.74","Suffolk","Hahn","Victor","1967-03-27","0","SUMMER MADNESS","2020-08-04"),("vulputate",49,2,"89.90","Essex","Snyder","Noel","1990-03-09","0","","2019-07-26"),("vitae,",45,1,"70.80","Warwickshire","Mcfadden","Noah","1976-12-11","1","","2019-02-03"),("convallis",37,3,"77.62","Kincardineshire","May","Allegra","1964-03-19","1","","2019-03-02"),("sagittis.",96,5,"0.79","Inverness-shire","Meadows","Herrod","1950-12-21","1","","2019-04-03"),("quam,",73,1,"38.37","Dunbartonshire","Mccarty","Giacomo","1946-12-01","1","","2019-07-06"),("lacus.",91,5,"28.80","Rutland","Walls","Tamekah","2003-03-04","0","SUMMER MADNESS","2020-10-09"),("Suspendisse",75,2,"43.30","East Lothian","Cochran","Clark","1946-09-15","1","SUMMER MADNESS","2019-09-06");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("Integer",77,2,"50.11","Norfolk","Chandler","Britanni","1960-11-01","1","SUMMER MADNESS","2020-05-23"),("semper",64,4,"55.04","Surrey","Harper","Francesca","1969-08-31","1","","2019-05-04"),("scelerisque",58,4,"96.68","Lanarkshire","Woods","Irma","1955-08-07","1","","2019-10-07"),("eu",83,4,"88.52","Radnorshire","Sullivan","Grace","1951-09-10","0","","2019-02-08"),("quis",26,4,"85.21","Kincardineshire","Pierce","Alan","1939-04-26","1","","2020-04-18"),("nascetur",50,4,"93.89","Ayrshire","Klein","Andrew","1996-07-19","1","PROMO10","2019-08-19"),("pharetra.",49,2,"81.04","Orkney","Durham","Lillian","1958-04-08","0","","2019-04-29"),("Mauris",93,2,"14.75","Oxfordshire","Cash","Chandler","1997-09-28","0","","2020-02-20"),("Ut",18,3,"43.38","Dumfriesshire","Hill","Abel","1982-12-02","1","SUMMER MADNESS","2019-09-03"),("dis",70,5,"96.52","Angus","Chen","Dante","1947-11-20","0","PROMO15","2019-05-26");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("magna",77,5,"2.81","Shetland","Mcfarland","Yoshio","1935-01-13","0","PROMO15","2019-12-26"),("rutrum.",78,2,"88.40","Stirlingshire","Lucas","Lionel","1991-09-13","1","SUMMER MADNESS","2019-03-30"),("Ut",4,5,"1.18","Durham","Leblanc","Hilel","1987-12-07","0","PROMO10","2019-06-02"),("elit,",89,1,"10.40","Dorset","Kidd","Bert","1936-06-22","1","SUMMER MADNESS","2019-05-21"),("Cum",90,1,"66.38","Aberdeenshire","Langley","Naida","1969-12-02","1","","2019-12-11"),("vulputate",25,5,"8.22","Kinross-shire","Bray","Griffin","1941-02-14","1","SUMMER MADNESS","2019-02-13"),("magna",47,5,"11.32","Devon","Torres","Gareth","1982-06-05","1","PROMO10","2019-10-19"),("netus",56,3,"25.92","Worcestershire","Hill","Blaze","1944-08-23","1","","2019-06-14"),("Aenean",64,5,"30.82","Devon","Pratt","Brett","1999-10-13","0","SUMMER MADNESS","2020-01-10"),("risus.",71,1,"25.91","Herefordshire","Mcfadden","Julian","1989-06-22","0","","2020-09-20");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("egestas.",60,5,"81.47","Essex","Langley","Demetrius","1937-11-20","0","PROMO10","2020-04-26"),("at,",24,3,"51.77","Montgomeryshire","Baird","Justina","1938-12-23","1","PROMO15","2020-05-08"),("ligula.",23,3,"7.48","Argyllshire","Hale","Celeste","1941-09-30","0","PROMO10","2020-01-07"),("lacus.",84,4,"93.48","Lanarkshire","Riddle","Burton","1987-11-02","1","SUMMER MADNESS","2020-05-31"),("gravida.",48,5,"21.18","Gloucestershire","Wilkerson","Barrett","1987-02-02","0","SUMMER MADNESS","2020-09-01"),("neque",98,1,"98.34","Angus","Joyce","Daquan","1987-05-09","0","","2020-05-03"),("ac",39,4,"19.45","Kirkcudbrightshire","Battle","Sydney","1961-02-11","0","PROMO10","2019-08-05"),("nec",3,3,"91.79","Shropshire","Flores","Blaine","1971-03-06","1","SUMMER MADNESS","2019-05-21"),("dolor.",76,4,"39.48","Dumfriesshire","Patterson","Lester","1955-04-08","1","","2020-03-05"),("Phasellus",7,4,"59.27","Westmorland","Ayala","Cade","1977-08-04","0","PROMO15","2020-04-14");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("convallis",91,5,"16.01","Radnorshire","Flores","Quon","1969-08-12","0","SUMMER MADNESS","2021-01-19"),("Phasellus",34,4,"34.34","Essex","Hicks","Meredith","1952-02-18","1","PROMO15","2019-11-20"),("Nunc",48,2,"67.99","Sussex","Witt","Riley","1947-06-20","1","","2019-11-04"),("ac",77,5,"53.43","Cambridgeshire","Stanton","Luke","1985-12-23","0","","2020-11-19"),("aliquam",31,3,"30.17","Gloucestershire","Hill","Henry","1965-11-25","1","","2019-06-20"),("purus,",39,1,"91.33","Cumberland","Fuller","Taylor","1985-09-06","0","PROMO15","2019-09-28"),("interdum",44,2,"96.01","Gloucestershire","Lowery","Cameran","1937-09-18","0","PROMO10","2019-08-29"),("dictum",12,2,"98.78","Kinross-shire","Cotton","Akeem","1938-12-05","0","","2020-12-01"),("sapien",18,3,"42.92","Fife","Rogers","Tanek","1974-07-15","1","PROMO10","2019-12-17"),("orci",36,2,"16.00","Dorset","Dudley","Carolyn","1934-09-06","0","","2020-11-23");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("auctor",25,2,"17.69","Inverness-shire","Rosario","Clarke","1956-06-06","0","PROMO15","2020-06-13"),("sit",97,5,"14.81","Warwickshire","Blackburn","Colleen","1971-05-31","1","SUMMER MADNESS","2020-09-17"),("Cras",36,4,"28.78","Herefordshire","Erickson","Kibo","1981-09-28","1","","2020-07-08"),("nascetur",64,2,"99.18","East Lothian","Pratt","Tanner","1983-06-09","1","SUMMER MADNESS","2020-08-12"),("mus.",89,2,"79.57","Wiltshire","Sheppard","Geraldine","1961-09-23","1","PROMO10","2020-11-02"),("nascetur",25,3,"45.32","Hertfordshire","Mitchell","Roary","1980-05-29","0","","2020-04-21"),("dolor.",83,5,"84.66","Berkshire","Mccullough","Maris","1951-08-12","0","","2019-06-12"),("Nunc",4,4,"75.87","Dunbartonshire","Burke","Myra","1951-04-02","0","SUMMER MADNESS","2020-11-04"),("feugiat",21,2,"95.19","Carmarthenshire","Love","Vivien","1954-01-28","1","","2020-09-17"),("nunc",84,1,"32.04","Dumfriesshire","Mcguire","Driscoll","1958-05-07","0","PROMO15","2019-08-07");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("sed",55,3,"34.14","Angus","Nichols","Dane","1952-06-11","0","PROMO10","2019-07-08"),("eget,",62,3,"26.96","Kent","Craft","Mona","1993-05-13","0","PROMO10","2020-08-29"),("ac",82,2,"4.12","Nottinghamshire","Underwood","Lester","2000-02-14","0","","2020-02-28"),("fringilla",75,4,"18.51","Radnorshire","Suarez","Alfonso","1955-09-10","1","","2019-05-22"),("bibendum.",33,1,"16.93","Argyllshire","Roberson","Juliet","1967-04-12","1","","2019-04-26"),("consequat",24,3,"55.02","Huntingdonshire","Weaver","Wallace","1985-12-11","0","","2019-01-12"),("Nunc",61,4,"28.82","Selkirkshire","Black","Trevor","1947-01-26","0","","2020-11-15"),("Phasellus",30,3,"71.76","Sutherland","Sloan","Ahmed","1969-11-02","1","PROMO15","2020-03-02"),("Nam",92,5,"70.56","Dumfriesshire","Holloway","Amelia","1941-11-09","0","SUMMER MADNESS","2020-07-17"),("semper.",36,2,"68.20","Lincolnshire","Hopper","Otto","1991-04-22","1","PROMO15","2020-08-21");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("Duis",14,5,"95.71","Cambridgeshire","Lowe","Igor","1947-12-27","1","PROMO15","2020-04-06"),("lacinia.",12,3,"67.07","Berkshire","Cobb","Ila","1994-09-03","0","SUMMER MADNESS","2020-03-19"),("Ut",73,2,"25.82","Lanarkshire","Love","Keith","1942-07-31","1","","2020-11-05"),("at",91,1,"42.02","Brecknockshire","Carey","Lee","1985-05-26","1","SUMMER MADNESS","2021-01-22"),("sapien",79,1,"79.40","Banffshire","Andrews","Quin","1995-02-17","1","","2020-10-21"),("elementum",44,4,"29.39","Cheshire","Howard","Hoyt","1977-07-08","1","PROMO15","2020-04-24"),("odio.",94,4,"10.64","Flintshire","Castro","Suki","1986-08-15","0","PROMO15","2019-04-13"),("lorem,",93,1,"98.30","Essex","Glover","Vivien","2001-10-01","1","","2020-11-23"),("at",3,1,"86.88","Morayshire","Alvarez","Grace","1959-11-18","1","","2020-11-28"),("Aliquam",75,2,"41.77","Cardiganshire","Knight","Quintessa","1970-01-30","0","","2019-08-24");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("lectus",20,4,"18.78","Kirkcudbrightshire","Daniels","Gabriel","1972-08-25","1","PROMO15","2020-06-17"),("ante",98,3,"39.36","Ross-shire","Knox","Damon","1953-02-27","0","","2021-01-22"),("primis",98,2,"69.05","Worcestershire","Pacheco","Elijah","1961-07-10","1","","2020-10-15"),("In",74,1,"32.55","Buteshire","Gillespie","Daria","1999-03-20","1","","2019-07-05"),("eros.",27,5,"73.31","Devon","Watson","Cally","1942-10-21","1","PROMO10","2020-04-19"),("sit",82,5,"52.98","Wiltshire","Small","Isadora","1973-05-18","1","PROMO15","2020-05-22"),("rutrum",72,5,"76.96","Montgomeryshire","Mcgowan","Garrison","1959-11-15","0","SUMMER MADNESS","2020-02-03"),("ipsum",95,1,"12.07","Merionethshire","Moran","Felicia","1986-09-03","1","","2019-01-19"),("eget,",37,3,"51.55","Flintshire","Acosta","Constance","1960-03-30","0","SUMMER MADNESS","2020-07-29"),("elit.",60,2,"15.12","Cumberland","Kaufman","Rhiannon","1993-06-17","0","","2020-03-17");
INSERT INTO `orders` (`trans_date`,`product_id`,`category_id`,`price`,`county`,`customer_surname`,`customer_firstname`,`date_of_birth`,`newsletter`,`promo_code`,`date_of_sale`) VALUES ("nec",96,5,"12.87","Anglesey","Mccoy","Gage","1960-03-30","1","SUMMER MADNESS","2020-12-27"),("vel,",56,1,"49.99","Midlothian","Blankenship","Alfonso","1938-02-10","0","SUMMER MADNESS","2019-08-17"),("arcu.",43,3,"86.12","Sussex","Lloyd","Abigail","1970-02-17","0","","2020-09-22"),("non",12,5,"73.40","Carmarthenshire","Rodriguez","Sharon","1958-11-07","0","","2020-03-12"),("nec",30,5,"56.30","Lanarkshire","Bray","Maryam","1962-06-21","0","","2019-01-17"),("dolor",45,4,"10.22","Dorset","Patton","Patrick","1958-11-27","1","","2020-07-07"),("Praesent",83,5,"44.92","Merionethshire","Gay","Sawyer","1979-05-05","1","PROMO15","2019-10-06"),("consectetuer",16,3,"50.40","Worcestershire","Pace","Shea","1951-08-27","0","","2020-06-07"),("risus.",44,5,"93.79","Worcestershire","Wyatt","Garrett","1982-09-19","0","","2020-03-27"),("parturient",92,4,"87.03","Buckinghamshire","Dominguez","Shelley","1973-09-20","0","PROMO10","2021-01-29");


CREATE TABLE `categories` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `category_name` TEXT default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `categories` (`category_name`) VALUES ("Party"),("Gadgetts"),("Costume"),("Celebration"),("Joke");


CREATE TABLE `promotions` (
  `code` varchar(20) NOT NULL,
  `discount` float(4,2) default NULL,
  PRIMARY KEY (`code`)
);

INSERT INTO `promotions` (`code`, `discount`) VALUES ("PROMO10", "10"),("PROMO15", "15"),("SUMMER MADNESS","35");

--
-- SQL Query
--

-- example 1 - simple select

--SELECT * FROM `orders`;


--
-- WHERE 
--

-- example 2 - where customers are registered to receive the newsletter

--SELECT * FROM `orders` WHERE newsletter = 1 ;

-- example 3 - show sales by customers born before 26th February 1960

--SELECT * FROM `orders` WHERE `date_of_birth` < '1960-02-26';

-- example 4 - show sales from categories 1,3 & 5

--SELECT * FROM `orders` WHERE `category_id` IN (1,3,5);

-- example 5 - how sales not from categories 1 & 2

--SELECT * FROM `orders` WHERE `category_id` NOT IN (1,2);

-- example 6 - sales from customer living in counties beginning with D

--SELECT * FROM `orders` WHERE `county` LIKE 'D%';

-- example 7 - sales from customer living in counties ending with shire

--SELECT * FROM `orders` WHERE `county` LIKE '%shire';

-- example 8 - sales from customer living in counties that contain th

--SELECT * FROM `orders` WHERE `county` LIKE '%th%';


-- LOGICAL OPERATORS

-- example 9 - AND, born after DOB 26th Feb 1960 and get newsletters

--SELECT * FROM `orders` WHERE `date_of_birth` > '1960-02-26' AND `newsletter` = '1';

-- example 10 - OR, born before or after the 1970s

--SELECT * FROM `orders` WHERE `date_of_birth` < '1970-01-01' OR `date_of_birth` > '1979-12-31';

--
-- ORDER
--

-- example 11 - show sales in category 3, order by product_id

-- SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `product_id` ;

-- example 12 - show sales in category 3, order by product_id DESC

-- SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `product_id` DESC;

-- example 13 - show sales in category 3, order by surname, firstname

-- SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `customer_surname`, `customer_firstname`;

-- example 14 - show sales in category 3, order by surname DESC, firstname

-- SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `customer_surname` DESC, `customer_firstname`;



--
-- SELECT FIELDS, Aliases & Functions
--

-- example 15 - list only the customer_surname, customer_firstname & county fields.

--SELECT `customer_surname`, `customer_firstname`, `county` FROM `orders`;

-- example 16 - Alias fields names

-- SELECT `customer_surname` as 'Surname', `customer_firstname` as 'Firstname', `county` as 'County' FROM `orders`;

--
-- Functions & GROUP BY
--

-- example 17 - Upper and Lower functions

--SELECT UPPER(`customer_surname`), LOWER(`customer_firstname`), `county` FROM `orders`;

-- example 18 - Concatenate fields and strings

--SELECT CONCAT(`customer_firstname`, ' ', `customer_surname`) AS 'Name', `price` AS 'Price' FROM `orders`; 

-- count number of rows returned

--SELECT COUNT(*) FROM `orders`;

-- example 19 - count orders by category

--SELECT `category_id`, COUNT(*) FROM `orders` GROUP BY `category_id`;

-- example 20 - count, sum, avg, min, max functions

--SELECT `category_id`, COUNT(*), SUM(`price`), AVG(`price`), MIN(`price`), MAX(`price`) FROM `orders` GROUP BY `category_id`;

-- example 21 - Round, Truncate, Ceil & Floor functions

/* SELECT `category_id`, COUNT(*), AVG(`price`) as 'AVG', ROUND(AVG(`price`),2) as 'Round', TRUNCATE(AVG(`price`),2) as 'Truncate',
CEIL(AVG(`price`)) as 'Ceil', FLOOR(AVG(`price`)) as 'Floor' FROM `orders` GROUP BY `category_id`; */
