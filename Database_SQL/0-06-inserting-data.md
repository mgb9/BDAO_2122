# Inserting Data

Data can be inserted with the use of the INSERT command.

Typical syntax is:

```
INSERT INTO <table_name> ( <field_list> ) VALUES ( <field_list_values> )
```

This example will insert a single row. To insert multiple rows, the values for each row can be 
supplied as a comma separated list:

```
INSERT INTO <table_name> (<field_list>) VALUES
(<row1_field_list_values>),
(<row2_field_list_values>),
(<row3_field_list_values>);
```

Example code:

```sql
-- insert a single row
INSERT INTO `oc_shipping_courier` (`shipping_courier_code`, `shipping_courier_name`) VALUES 
('dhl', 'DHL');
-- add a multiple records to the oc_shipping_courier table 
INSERT INTO `oc_shipping_courier` (`shipping_courier_code`, `shipping_courier_name`) VALUES 
 ('fedex', 'Fedex'), 
 ('ups', 'UPS'),
 ('royal-mail', 'Royal Mail'),
 ('usps', 'United States Postal Service'),
 ('auspost', 'Australia Post');
```
