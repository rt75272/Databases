
---
### MySQL Practice
&nbsp;  
MySQL database practice problems. 

---

__BACKGROUND INFORMATION__  
_Objective:_ To match the domain names listed in mariana db sql New2 with domains in mariana db sql Board; and then take an identifying 9 digit number that is in New 2 for that domain and place that number for the same domain inside the column for Board.

The domains in the tables do not have a consistent format. Not all rows have a website or domain entry in New2 and some will say Null or N/A or be empty and should be ignored. In Board a very great majority of the rows will have a domain otherwise it will be Null.

Every answer must have three parts:  
 - a. Code example
 - b. How and where the code should be placed  
 - c. An explanation of why and what the code does  
(New2 has 1.8M rows and Board has 70,000 rows.)  

&nbsp;    
___#1__  
Provide exact step by step instructions of how to backup a very large database table called New2 and another called Board?_

To backup a database table, you can use a command line tool such as `mysqldump`. This tool allows you to create a file containing the SQL statements needed to recreate the table. To back up the `New2` and `Board` tables, you would run the following command:

```bash
$ mysqldump -u username -p db_name New2 Board > backup.sql
```

This command will create a file called `backup.sql` that contains the SQL statements needed to recreate the `New2` and `Board` tables. Replace `username` with your MySQL username and `db_name` with the name of your database. You will be prompted to enter your password when you run this command.

&nbsp;    
___#2__  
There are some 9 digit numbers already in the table called Board in column called ein, perhaps a few thousand. How would you query for an exact count of ein column and not overwrite the numbers in all future activities?_


This following script can be run in a database management tool, such as MySQL Workbench, after connecting to the database containing the New2 and Board tables.

```sql
UPDATE Board
SET ein = (SELECT ein FROM New2 WHERE New2.domain = Board.domain)
WHERE EXISTS (SELECT 1 FROM New2 WHERE New2.domain = Board.domain)
AND Board.ein IS NULL;
```

This script performs an update on the `Board` table, setting the value of the `ein` column to the corresponding value from the `ein` column in the `New2` table for any row in the `Board` table where the domain column matches the `domain` column in the `New2` table and where the `ein` column in the `Board` table is currently null.

This effectively matches the domains in the `New2` and `Board` tables, and takes the identifying 9 digit number from the `New2` table and places it in the `ein` column in the `Board` table for the same domain.

The `WHERE EXISTS (SELECT 1 FROM New2 WHERE New2.domain = Board.domain)` clause ensures that the update is only performed for rows where there is a matching domain in the `New2` table, and the `AND Board.ein IS NULL` clause ensures that the update is only performed for rows where the `ein` column in the `Board` table is currently null. This helps to prevent overwriting any existing values in the `ein` column.

To get an exact count of the number of rows in the `ein` column that already have a value, you can use the following query:

```sql
SELECT COUNT(*) FROM Board WHERE ein IS NOT NULL;
```
This will count the number of rows in the `Board` table where the `ein` column is not null, giving you the number of rows that already have a value in the `ein` column.

&nbsp;    
___#3__  
How will you isolate and format all the domains into a consistent format in table New2, column called website? These have no consistent format - some have http some https, some www, some just the domain name, some a page on the website._



The following script can be run in a database management tool, such as MySQL Workbench, after connecting to the database containing the `New2` table.

```sql
UPDATE New2
SET website = TRIM(BOTH 'www.' FROM
  TRIM(BOTH 'http://' FROM
  TRIM(BOTH 'https://' FROM
  TRIM(BOTH '/' FROM website))))
```

This script performs an update on the `New2` table, setting the value of the `website` column to the same value with all instances of `'www.'`, `'http://'`, `'https://'`, and `'/'` removed. This will leave just the domain name, formatted in a consistent way.

The `TRIM()` function is used to remove the specified characters from the beginning and end of the `website` column value. The `BOTH` keyword specifies that the characters should be removed from both the beginning and the end of the value. The `FROM` keyword specifies the string to be trimmed. The `TRIM()` function is nested to remove all of the specified characters in a single update statement.

This update statement will format all of the values in the `website` column in a consistent way, making it easier to match the domains in the `New2` and `Board` tables.

&nbsp;    
___#4__  
How will you isolate and format all the domains into a consistent format in the table Board column called fullText ? These are pages within a website and the domain needs to be extracted._

The following script performs an update on the `Board` table, setting the value of the `fullText` column to the value of the domain name. The domain name is extracted by taking the substring up to the first occurrence of `'/'`.

The `SUBSTRING_INDEX()` function returns the substring from the `fullText` column up to the specified occurrence of the delimiter `'/'`. The `UPDATE` statement sets the value of the fullText column to this substring for all rows in the `Board` table.

This update statement will extract the domain name from the `fullText` column and format it in a consistent way, making it easier to match the domains in the `New2` and `Board` tables.

```sql
UPDATE Board
SET fullText = SUBSTRING_INDEX(fullText, '/', 1)
```

&nbsp;    
___#5__  
How will you match the domains from table Board column called fullText to table New2 column called website and then insert the data from column ein from New2 into table Board column ein in the appropriate row?_


```sql
UPDATE Board
SET ein = (SELECT ein FROM New2 WHERE New2.website = Board.fullText)
WHERE EXISTS (SELECT 1 FROM New2 WHERE New2.website = Board.fullText)
AND Board.ein IS NULL;
```

This script performs an update on the `Board` table, setting the value of the `ein` column to the corresponding value from the `ein` column in the `New2` table for any row in the `Board` table where the `fullText` column matches the `website` column in the `New2` table and where the `ein` column in the `Board` table is currently null.

This effectively matches the domains in the `New2` and `Board` tables, and takes the identifying 9 digit number from the `New2` table and places it in the `ein` column in the `Board` table for the same domain.

The `WHERE EXISTS (SELECT 1 FROM New2 WHERE New2.website = Board.fullText)` clause ensures that the update is only performed for rows where there is a matching domain in the `New2` table, and the `AND Board.ein IS NULL` clause ensures that the update is only performed for rows where the `ein` column in the `Board` table is currently null. This helps to prevent overwriting any existing values in the `ein` column.

&nbsp;    
___#6__  
How will you provide the new count for data in table Board column called ein?_

```sql
SELECT COUNT(*) FROM Board WHERE ein IS NOT NULL;
```

This script returns the count of all rows in the `Board` table where the `ein` column is not null. The `COUNT(*)` function counts the number of rows that meet the condition specified in the `WHERE` clause, which is `ein IS NOT NULL`. This will give you the number of rows in the `Board` table that have a value in the `ein` column.

This query can be used to provide the new count of data in the `ein` column after the update has been performed to match the domains in the `New2` and `Board` tables and insert the identifying 9 digit number from the `New2` table into the `ein` column in the `Board` table.

Basic database schema:  
![Database Schema](database_schema.png "Database Schema")  
