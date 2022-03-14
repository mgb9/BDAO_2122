# Data Query Language - SELECT

One of the most powerful SQL commands is SELECT, over the next few examples we are going to 
demonstrate various searches, with the aim of providing the building blocks for data extraction 
useful not only in SQL but in almost any reference to data you may come across.

All examples in this section are provided in the file 

**NOTE**: As all examples are provided in a single file, you will need to uncomment and comment 
relevant lines within the file as you progress through the examples.

Basic syntax for SELECT:

```
SELECT * FROM <table>;
```

TThis is requesting that all fields (this is what the * denotes) from the table specified. When example 
1 is run:

```sql
-- simple select
SELECT * FROM `orders`;
```

This will return all fields, and all rows in the table \`orders\`.

## SELECT ... WHERE

If we now wanted to extract all records where the newsletter field held a value of 1 i.e. the customer 
is registered to receive a newsletter, we would change the SQL as per example 2:

```sql
-- example 2 - where customers are registered to receive the newsletter
SELECT * FROM `orders` WHERE newsletter = 1 
```

You will now notice that the results pane only shows records where newsletter = 1.

## Comparison Operators

WHERE uses a comparison operator, the following table lists common comparison operators:

- = Equal to
- \> Greater than
- < Less than
- \>= Greater than or equal to
- <= Less than or equal to

We can now use the comparison operators to do more complex queries such as selecting all 
customers who were born before 26th February 1960.

**NOTE**: Dates in MySQL follow the format:

```YYYY-MM-DD```

So the SQL for this search is:

```sql
-- example 3 - show sales by customers born before 26th February 1960
SELECT * FROM `orders` WHERE `date_of_birth` < '1960-02-26';
```

## Sets

In addition to the standard comparison operators, we also have the two operators:

- IN
- NOT IN

IN will return rows where a value matches one in a given list, whilst NOT IN will do the opposite and 
return those rows where the matches are not met.

Example 4 demonstrates the IN operators, by returning all rows where the category_id is either 1, 3, 
or 5:

```sql
-- example 4 - show sales from categories 1,3 & 5
SELECT * FROM `orders` WHERE `category_id` IN (1,3,5);
```
Example 5 demonstrates NOT IN by selecting all rows where category_id is not one of 1 or 2:

```sql
-- example 5 - how sales not from categories 1 & 2
SELECT * FROM `orders` WHERE `category_id` NOT IN (1,2);
```
All rows returned have category_ids of 3,4 or 5

## String Comparison

To compare if a string matches, we can simply use the = comparison operator. SQL has the LIKE 
command, which when combines with the % character (% is the wildcard character in SQL) allows for 
string searches when looking for substrings.

Example 6 demonstrates a query where all counties starting with the letter D are returned. It does 
this with

```
WHERE county LIKE ‘D%’
```

**NOTE**: Remember to enclose the string in single quotes, and use the % character as a wildcard.

```sql
-- example 6 - sales from customer living in counties beginning with D
SELECT * FROM `orders` WHERE `county` LIKE 'D%';
```

Examples 7 & 8 (in the example file) show similar uses of the LIKE operator and the % character to 
match strings.

## Logical Operators

SQL provides the AND & OR logical operators so that we can combine comparisons.

Example 9 demonstrates a query that returns all order where the date_of_birth was after ‘1960-02-
26’ (26th February 1960), and the customer is registered to receive newsletters

```sql
-- example 9 - AND, born after DOB 26th Feb 1960 and get newsletters
SELECT * FROM `orders` WHERE `date_of_birth` > '1960-02-26' AND `newsletter` = '1';
```

Example 10 demonstrates an OR operators by returning rows where the date of birth was either 
before ‘1970-01-01’ or after ‘1979-12-31’

```sql
-- example 10 - OR, born before or after the 1970s
SELECT * FROM `orders` WHERE `date_of_birth` < '1970-01-01' OR `date_of_birth` > '1979-12-31';
```

## ORDER BY ASC & DESC

So far, all queries have returned the results most probably in order that the rows were added to the 
table. 

We have the ORDER BY keywords that allow control over the order of the results.

The ORDER BY keyword expects a field (or several fields) to be specified, as in example 11:

```sql
-- example 11 - show sales in category 3, order by product_id
SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `product_id` ;
```

Here we are ordering the results by the field product_id.

By default the order is ASC (Ascending), but we can change that with the DESC (Descending) 
keyword, specified after the field, as in example 12.

```sql
-- example 12 - show sales in category 3, order by product_id DESC
SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `product_id` DESC;
```

ORDER BY allows for several fields to be specified, assume we have a list of orders and we want the 
list to be order by both surname and firstname, we would use the code from example 13:

```sql
-- example 13 - show sales in category 3, order by surname, firstname 
SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `customer_surname`, `customer_firstname`;
```

**NOTE**: The order of the results are by surname, towards the bottom of the results, there are two 
rows for a customers called ‘Velez’ but as we specified to order by customer_firstname also, the order 
has the row for Griffin before the row for Martha.

We also have the option to specify different order directions on the different fields in the ORDER BY 
list. Example 14 demonstrates this by ordering by customer_surname descending (DESC), and then 
by customer_firstname bythe default value ascending (ASC).

```sql
-- example 14 - show sales in category 3, order by surname DESC, firstname
SELECT * FROM `orders` WHERE `category_id` = 3 ORDER BY `customer_surname` DESC, 
`customer_firstname`;
```

## Selecting Fields & Aliases

So far we have used SELECT * to select all fields. We can select specified fields with the syntax 
shown in example 15:

```sql
-- example 15 - list only the customer_surname, customer_firstname & county fields.
SELECT `customer_surname`, `customer_firstname`, `county` FROM `orders`;
```

We also have the ability to rename fields (alias) by using the AS keyword and supplying new names
such as in example 16:

```sql
-- example 16 - Alias fields names
SELECT `customer_surname` as 'Surname', `customer_firstname` as 'Firstname', `county` as 'County' 
FROM `orders`;
```

**NOTE**: The renamed column titles in the results pane.

## String Functions

SQL provides functions that can be used in SELECT and UPDATE commands. Three useful functions 
for manipulating text are:

- UPPER() to convert a string to uppercase
- LOWER() to convert a string to lowercase
- CONCAT() to join 2 or more strings

Example 17 demonstrates the use of the UPPER() & LOWER() functions:

```sql
-- example 17 - Upper and Lower functions
SELECT UPPER(`customer_surname`), LOWER(`customer_firstname`), `county` FROM `orders`;
```

Example 18 concatenates two fields (customer_firstname & customer_lastname) but also adds a 
space between the two fields.

```sql
-- example 18 - Concatenate fields and strings
SELECT CONCAT(`customer_firstname`, ' ', `customer_surname`) as 'name', `price` FROM `orders`;
```

## GROUP BY & Aggregate Functions

Sometimes, we may want to group all records of a certain type, we can do this with the GROUP BY 
keywords.

As an example let look again at the data and extract the count of total orders for each category.

The SQL is found in example 19:

```sql
-- example 19 - count orders by category
SELECT `category_id`, COUNT(*) FROM `orders` GROUP BY `category_id`;
```

So far we have been using the COUNT() function without explanation. COUNT() is part of a group of 
functions called Aggregate functions as the aggregate data from multiple rows. Aggregate functions 
work well with the GROUP BY keywords.

Other useful aggregate functions are:

- SUM() total of all values in rows
- AVG() average of all values in rows
- MIN() the minimum value found in all rows
- MAX() the maximum value found in all rows

In example 20, we see all these aggregate functions in actions, when we group all results by category
id, and then report the number of rows (COUNT), total value of orders (SUM), average price (AVG), 
maximum price (MAX) & minimum price (MIN).

```sql
-- example 20 - count, sum, avg, min, max functions
SELECT `category_id`, COUNT(*), SUM(`price`), AVG(`price`), MIN(`price`), MAX(`price`) FROM `orders` 
GROUP BY `category_id`;
```

## Numerical Functions

As we can see in the results from the previous example, sometimes numbers will be returned to 
many decimal places. We have a set of numerical functions that we can use to improve the 
presentation, these are:

- ROUND() Round a number to a specific number of decimal places
- FLOOR() Return the largest integer that is smaller then the given number
- CEIL() Return the smallest integer that is bigger than the given number
- TRUNCATE() Returns a given number to a specific number of decimal places (no 
rounding)

Example 21 demonstrates these functions:

```sql
-- example 21 - Round, Truncate, Ceil & Floor functions
SELECT `category_id`, COUNT(*), AVG(`price`) as 'AVG', ROUND(AVG(`price`),2) as 'Round', 
TRUNCATE(AVG(`price`),2) as 'Truncate', CEIL(AVG(`price`)) as 'Ceil', FLOOR(AVG(`price`)) as 'Floor' FROM 
`orders` GROUP BY `category_id`;
```

The difference between ROUND & TRUNCATE, can be seen in the results on the row for category id 
3. The result of the ROUND has produced 51.95 (correct when we are rounding from 51.947), yet 
the truncate has simply removed the excess digits and produced 51.94.
