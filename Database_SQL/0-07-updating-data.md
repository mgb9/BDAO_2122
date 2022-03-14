# Updating Data

Records can be updated in a table with the UPDATE command.

Typical Syntax is:

```
UPDATE <table> SET <field> = <value>
```

This command would update all rows in the table, so we are going to introduce the WHERE option.

**NOTE**: WHERE can be used on several commands i.e. UPDATE, DELETE & SELECT so it is wise to 
become familiar with its syntax.

If we only want to update a specific record we would use the following syntax:

```
UPDATE <table> SET <field> = <value> WHERE <ref_field> = <ref_value>
```

Example code:

```sql
-- update a single row
UPDATE `oc_shipping_courier` SET `shipping_courier_code` = 'rm' WHERE `shipping_courier_id` 
= 4;
```

SQL now only updates the record with a shipping_courier_id of 4

If you run this example in DB Fiddle, the results pane will list the oc_shipping_courier table twice, 
the first time, the record for ‘Royal Mail’ (shipping_courier_id = 4) has a shipping_courier_code of 
‘royal-mail’.

The second listing of the table, shows that the courier code has now changed to ‘rm’.
