
my submission: https://github.com/salehiin/levelTwo_assignmentTwo

# https://github.com/Apollo-Level2-Web-Dev/B5A2

# 7.2 - create database
# 7.7 - database create, update, delete
# 7.8 - create table in related database using valetina studio

# 7.11 - insert data into studio

# 8.1 -  start of using vs code - change database
# 8.2 - column add, column drop, rename column, column type change, constraint change, constraint remove
# 8.3 - add constraint, details of unique, add primary key later, truncate - clear full table - no data
# 8.4 - show all or specific data from a table, column name alias, ascending - descending - order by
# 8.5 - unique data, sorted data, sort using multiple condition, comparison operator
# 8.6 - upper case, concat, scalar & aggregate function, avg, max, length
# 8.7 - NOT, NULL, where column is null, coalesce(null, 'not provided') - set default value instead of null, 
- column name should in double coat
# 8.8 - IN, NOT IN, between, order by, like, ilike, __ %, __ __, 
# 8.9 - pagination - limit - offset, delete
# 8.10 - update, where
# 9.1 - date, date functions
# 9.2 - group by, having
# 9.3 - create foreign key
# 9.4 - insert data with foreign key, individual data insert, prevent null data or null foreign key
# 9.5 - different cases when delete foreign key
# 9.6 - join - inner join, aliasing table name
# 9.7 - left join - right join
# 9.8 - full join, cross join, natural join
# 9.10 - practice - have to do again and again
# 10.1 - practice - have to do again and again
# 10.2 - subquery - nested query - scalar subquery - select - from - where
# 10.3 - main/outer query, multiple value possible after in
# 10.4 - view - a template - can use multiple times
# 10.5 - functions
# 10.6 - 


# 🐆 1. What is PostgreSQL?
# Postgress is a open source relational database management system. We can query with SQL(Structured Query Language) by postgress. some benefits using postgress:
    a. Open source.
    b. Relational Database Management System.
    c. Modern.
    d. ACID Compliance.
    c. Advanced Data Types.
    d. Scalability.
    e. Indexing.
    f. Big Community Support.

# 🐆 2. What is the purpose of a database schema in PostgreSQL?
# In a database tables are created under schema. Schemas' are like box in a database. Schemas' are made for different project instead of a new database for each project. In a database, there may be a lot of tables. In that case, schema prevents confusion of table names. sometime third party tables have to import, then schema protect from any conflicts. We can place tables in different schema. 

# 🐆 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
# In SQL, two key types commonly used to uniquely identify rows and define relationships are: Primary Key and Foreign Key.
1. Primary Key- To find each row uniquely, every table has a key column and it contains unique id for each row which is called primary key. 
2. Foreign Key- Foreign key also indetified a row uniquely but not the table where it placed but another table, on which table it is also a primary key. It's main purpose is to build connection between those two respective tables.
# 🐆 4. What is the difference between the VARCHAR and CHAR data types?
# VARCHAR and CHAR are 2 variation of character type data, like string in JavaScript. Below are there few differences:
- CHAR is a fixed length character type. It's length is fixed and specified when defining the column. If the actual string is shorter than the specified length, it is padded with spaces. Example- CHAR(10) means a fixed-length string of 10 characters
- VARCHAR is a variable-length chracter type. The length is not fixed and can vary up to the specified maximum length. No padding with spaces is done, so it is more storage-efficient when dealing with variable-length strings. Example- VARCHAR(255) means variable-length string with a maximum length of 255 characters. 
# 🐆 5. Explain the purpose of the WHERE clause in a SELECT statement.
# 🐆 6. What are the LIMIT and OFFSET clauses used for?
# When we need to specified which and how much data or how much row we need to get from the begining, we used LIMIT, and when specified from where and how much row we need to get we used LIMIT & OFFSET combinedly. Practical uses of these clause are Pagination.
# 🐆 7. How can you modify data using UPDATE statements?
# Explained below how to modify data using UPDATE statement; 
    UPDATE persons - first write UDATE clause then table name
    set country = 'Bangladesh', age = 30 - write set and which column to change, then the new data. single or multiple data can change at a time.
    WHERE person_id = 10; - write WHERE clause and primary key column name, then respective primary key
# 🐆 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
# 🐆 9. Explain the GROUP BY clause and its role in aggregation operations.
# 🐆 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
2. Count unique species ever sighted. 🐆
3. Find all sightings where the location includes "Pass".
4. List each ranger's name and their total number of sightings.
5. List species that have never been sighted.
6. Show the most recent 2 sightings.
7. Update all species discovered before year 1800 to have status 'Historic'.
8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'. 🐆
9. Delete rangers who have never sighted any species