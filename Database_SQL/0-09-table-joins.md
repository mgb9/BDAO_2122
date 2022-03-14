# Table Joins

SQL provide the JOINS keyword to join tables together i.e. associate rows in one table with the 
related rows in another.

Typical syntax:

```
SELECT * FROM <table1> JOIN <table2> ON ( field_in_table1 = field_in_table2 )
```
All the features demonstrated earlier such as WHERE, ORDER, GROUP BY are still relevant and can 
be used with JOIN. JOIN is simply a construct for joining 1 or more tables into the query, and the key 
areas of complexity when using joins are:

- Type of JOIN to use (INNER, LEFT and RIGHT being the most common)
- Naming of tables and referencing fields in a joined table SQL statement

## Field Naming

A common issue when joining two tables is that there may be overlap in the namespace for the 
attributes in those tables, a common issue is the primary key which is most often called id. 

```
SELECT id FROM `products` RIGHT JOIN `categories` 
```

Where it is selected from two joined tables, both with a primary key named ‘id’, the SQL parser is 
not clear on which id to display. We overcome this by giving tables alias names in the SQL 
statement, this is done like so:

```
SELECT p.id FROM `products` p RIGHT JOIN `categories` c 
```

In this statement, we can see that we have given the products table an alias of p, and the categories 
table an alias of c. When referencing the field we want, we use the notation p.id, to specify we want 
the id from the products table.

This notation is also relevant throughout the full SQL statement, i.e. needs to be used in the WHERE, 
ORDER and GROUP BY sections of the SQL statement.
