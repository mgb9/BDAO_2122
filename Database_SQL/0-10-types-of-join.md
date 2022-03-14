# Types of Join

The examples used in this section use the code from the file joins-example.sql

The DDL in our example file creates two tables:

- categories (4 rows)
- products. (9 rows)

## Default JOIN or INNER JOIN

Lets first look at the default JOIN in example 1:

```sql
-- example 1 - default join option - INNER JOIN, returns seven matching rows
SELECT * FROM `products` p JOIN `categories` c ON ( p.category_id = c.id );
```

The JOIN keyword has been used to join the categories and products tables. The JOIN details the 
tables to be joined:

```sql
FROM `products` JOIN `categories`
```

Whereas the ON keyword details the fields to be used in matching the join. In this case 
p.category_id

This SELECT statement returns 7 rows, these are the rows from the two tables that have a 
relationship. Products with no category (or an invalid category_id) are not included, these being 
Ladies Shoes & Gents Shoes. Neither were any categories included that have a relationship with the 
products, this being Christmas as none of the products are assigned the Christmas category.

This can be represented using the diagram below:

![inner-join](https://user-images.githubusercontent.com/49883951/146816571-ceca91ea-9016-4178-8965-d3c9bea26d9e.PNG)

Where it only retrieves values from the two tables that have relationships. 

The issue with this is that we may have wanted all the products regardless of a category being 
related, or all the categories regardless of a product being related.

This JOIN is also called an INNER JOIN and can be demonstrated in example 2:

```sql
-- example 23 - INNER JOIN - matches previous example
SELECT * FROM `products` p INNER JOIN `categories` c ON ( p.category_id = c.id );
```

If you compare the results pane, both statements return the same data.

## RIGHT JOIN

Now, to return all data from categories (the right table), we use the RIGHT JOIN keywords to give the 
right table (the table specified on the right of the JOIN keyword).

This can be represented:

![right-join](https://user-images.githubusercontent.com/49883951/146816794-404070be-a923-4487-adc3-e6df7c52dca4.PNG)

And demonstrated in example 3:

```sql
-- example 24 - RIGHT JOIN - all rows from categories, with matching rows from products
SELECT * FROM `products` p RIGHT JOIN `categories` c ON (p.category_id = c.id);
```

The results pane now shows 8 rows, that more importantly contain all categories.

## LEFT JOIN

Similarly, if we want to give priority to the left table (products) we would use the LEFT JOIN 
keywords.

This can be represented:

![left-join](https://user-images.githubusercontent.com/49883951/146817130-64a12e4e-1386-44b2-999a-15c91e5eb0da.PNG)

And demonstrated in example 4:

```sql
-- example 25 - LEFT JOIN - all rows from products, with matching rows in categories
SELECT * FROM `products` p LEFT JOIN `categories` c ON (p.category_id = c.id);
```

The results pane now shows 9 rows, all products.
