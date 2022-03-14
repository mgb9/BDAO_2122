# SQL Overview

SQL is structured into 4 main categories of command:

- DDL – Data Definition Language
- DQL – Data Query Language
- DML – Data Manipulation Language
- DCL – Data Control Language

## Data Definition Language (DDL)

DDL statements are a set of SQL commands used to define the structure of the database, the 
commands include:

- **CREATE**
- ALTER
- **DROP**
- RENAME
- TRUNCATE
- COMMENT

We will only use the CREATE and DROP commands in this workbook.

CREATE is the command to create an object in the database, in our examples we will be using it to 
create TABLES, but be aware that the CREATE command can be used to create other objects such as 
USERS, VIEWS, DATABASES etc.

**NOTE**: Many of the commands presented to you in this workbook have greater functionality than 
what is detailed here. For example, The syntax of the CREATE command will change depending 
upon the type of object you are creating. There are many resources available to continue your 
understanding of SQL if you require.

## Data Query Language (DQL)

DQL contains a single SQL command:

- SELECT

The SELECT command is a powerful command and is the single command used to extract data from 
the database. The syntax of the SELECT command is represented in this diagram:

![select-syntax](https://user-images.githubusercontent.com/49883951/146683687-0875d684-5500-4ede-a378-bc645ac66f2e.PNG)

As you can see there is a wide array of options that can be used in conjunction with SELECT. We 
will work through the options highlighted in blue using examples in this workbook.

## Data Manipulation Language (DML)

DML commands are used to manipulate data in the database, the commands available are:

- **INSERT**
- **UPDATE**
- **DELETE**
- MERGE
- CALL
- EXPLAIN PLAIN
- LOCK TABLE

## Data Control Language (DCL)

DCL provide SQL commands used by the Database administrator to configure access and security to 
databases. Commands available are:

- GRANT
- REVOKE

We will not be covering any DCL commands in this workbook as these are more relevant in a real 
environment and not applicable for demonstration under DB Fiddle.
