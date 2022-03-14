# SQL – Useful Commands

## Best Practice – Always Comment Your Code

As with any coding language, it is good practice to add comments to your code. This can be achieved 
in one of several ways:

To enter a comment on a single line use the -- syntax:

```sql
-- this is a single line comment
```

You can use this syntax to separate out sections of code:

```sql
--
-- Nice way to separate out code
--
```

If you need to enter a comment over several lines, you can also use the /\* \*/ syntax where the 
comment is inserted in between the /\* & \*/ like so:

```sql
/*
I want to write over several 
lines, possibly to document my table structure
*/
```

Finally, the SQL parser will allow you to write comments at the end of a line of standard SQL using 
either of the approaches detailed above:

```sql
SELECT * FROM my_table; -- list all entries in my_table
SELECT * FROM my_table; /* list all entries in my_table */
```

## Remember the semi colon ;

A semi colon is required at the end of each SQL statement. The semi colon is the standard way to 
separate statements. A single statement of SQL may execute correctly without the semi colon, but it 
is necessary if you have more than one statement, so it is good practice to always use the semi colon.

## SQL - Common Commands

A useful command that allows you to list all tables in the current schema is:

```sql
-- list the tables in this database
SHOW TABLES;
```

To detail a table use (replacing my_table with the table name):

```sql
-- describe the my_table table
DESCRIBE `my_table`;
```

To return all data in a table:

```sql
-- list all data in the table my_table
SELECT * FROM `my_table`;
```
