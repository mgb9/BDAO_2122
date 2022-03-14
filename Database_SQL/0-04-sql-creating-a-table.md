# SQL – Creating a Table

The following is an example of SQL used to create a table:

```sql
-- create the oc_product table
CREATE TABLE `oc_product` (
 `product_id` int(11) NOT NULL AUTO_INCREMENT,
 `model` varchar(64) NOT NULL,
 `sku` varchar(64) NOT NULL,
 `quantity` int(4) NOT NULL DEFAULT '0',
 `stock_status_id` int(11) NOT NULL,
 `image` varchar(255) DEFAULT NULL,
 `manufacturer_id` int(11) NOT NULL,
 `shipping` tinyint(1) NOT NULL DEFAULT '1',
 `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
 `status` tinyint(1) NOT NULL DEFAULT '0',
 `viewed` int(5) NOT NULL DEFAULT '0',
 `date_added` datetime NOT NULL,
 `date_modified` datetime NOT NULL,
 PRIMARY KEY (`product_id`)
);
```

This is a cut down copy of the SQL used to create the product table in the popular eCommerce 
solution Opencart. 

*I do not expect you to be creating tables of this size or complexity on the course (it is only here as a point of reference.)*

The syntax can be broken down into several simple segments:

#### The first line, instruct the SQL parser to create a table called oc_product.

![creating-table-1](https://user-images.githubusercontent.com/49883951/146683598-b793abe7-64bb-4f88-b502-3393a100f9f1.PNG)

There are three key points to note here:

- The create syntax – CREATE TABLE <name>
- The backtick character used to encase the table name
- The opening and closing brackets – these hold the detail that specified the structure of the 
table to be create, we will discuss these shortly.

**NOTE**: the character used when naming a table, field or any other object is the \` (backtick character)
and can be located on a keyboard to the left of the 1 key (top left). This is different to the ‘ (single 
quote, located to the right of the semi colon ) which is used to denote a string. By taking a look at 
the example above, you can see that the backtick was used to name the table - \`oc_product\` and each 
of the field names - \`product_id\`, \`model\` etc. Whereas the single quote is used to detail the default 
value to the fields quantity, shipping, price etc.
 
#### The content between the brackets details the structure of the table.

![creating-table-2](https://user-images.githubusercontent.com/49883951/146684089-ebcafec4-53db-4bac-a61c-66ca00cc91dc.PNG)
 
Each field is detailed, the structure of the table should resemble the logical design of your ER model 
for the table.

Each field follows the same syntax:
 
```
`<field name>` <datatype> <field options>
```

for example:

```sql
`product_id` int(11) NOT NULL AUTO_INCREMENT,
```

With each line separated by a comma.

The field name should be taken direct from your ER model, as should the data type. The value in 
brackets just after the data type details the size of the field:
 
`varchar(64)` details a string of variable length upto a maximum of 64 characters long.
 
`int(4)` whereas is slightly different as it details an integer with a display width of 4 digits.

There are a wide range of field options available. The options used in the examples are detailed 
here:
 
- `NOT NULL` - optional – specifies that the value must hold a value i.e. NOT NULL.
- `DEFAULT '0'` - optional – specified the default value for the field.
- `AUTO_INCREMENT` - optional – increments the value on each new row.
 
**NOTE**: AUTO_INCREMENT is typically used to increment the value of a primary key field.
 
The final line in the structure of the table:
 
```sql
PRIMARY KEY (`product_id`)
```
 
This specified that the field `product_id` is to be the primary key for this table.

## Compound or Composite Keys
 
The example below details the syntax when a combination of fields are used to create the primary 
key for a table.
 
```sql
-- create the sample_map_table table
CREATE TABLE `sample_map_table` (
 `other_table_id_1` int(11) NOT NULL,
 `other_table_id_2` int(11) NOT NULL,
 `detail` varchar(64) NOT NULL,
 PRIMARY KEY (`other_table_id_1`,`other_table_id_2`)
);
```

It is quite common to identify a table with a composite primary key i.e. the combination of two fields 
becomes unique and therefor can be used as the primary key to identify the row.
 
An example of where a composite key would be used is in the example below, where a database is 
designed to store student test results.
 
We have two main tables – students & test. The table test_results holds the score for a student for a 
test. Working on the logic that a student can only sit a test once, the combination of the fields 
student_id & test_id in the test_results table are unique, hence can be used in conjunction as a 
primary key.
 
![composite-keys](https://user-images.githubusercontent.com/49883951/146684590-071d3d9f-e705-40c9-a460-286949415e7a.PNG)

## Foreign Keys
 
We can map our foreign keys when creating a table, this can be done as in the example below:
 
```sql
CREATE TABLE `shipping` (
 `shipping_id` int(11) NOT NULL AUTO_INCREMENT,
 `shipping_courier_id` int(11) NOT NULL,
 `shipping_date` date NOT NULL,
 PRIMARY KEY (`shipping_id`),
 CONSTRAINT `fk_shipping_id` FOREIGN KEY (`shipping_courier_id`) REFERENCES 
 `shipping_courier`(`shipping_courier_id`)
);
```
 
The lines highlighted are detailing a foreign key constraint on the table. It is called a constraint as 
this table now expects the foreign key to be valid i.e. exists.
 
The syntax of the foreign key constraint is:
 
```
CONSTRAINT `<foreign key name>` FOREIGN KEY (`<this table field name>`) REFERENCES 
`<foreign table name>`(`<foreign table foreign reference field>`)
```

It is not mandatory to detail the foreign keys but can be useful when using the database to enforce 
business logic.
 
The code in the example file shows two insert statements, one will fail, one will succeed. You will 
need to comment/uncomment the relevant lines to test both scenarios.
