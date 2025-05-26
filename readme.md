


# 1. What is PostgreSQL?
🐆 Postgress is a open source relational database management system. We can query with SQL(Structured Query Language) by postgress. some benefits using postgress:
    a. Open source.
    b. Relational Database Management System.
    c. Modern.
    d. ACID Compliance.
    c. Advanced Data Types.
    d. Scalability.
    e. Indexing.
    f. Big Community Support.

# 2. What is the purpose of a database schema in PostgreSQL?
🐆 In a database tables are created under schema. Schemas' are like box in a database. Schemas' are made for different project instead of a new database for each project. In a database, there may be a lot of tables. In that case, schema prevents confusion of table names. sometime third party tables have to import, then schema protect from any conflicts. We can place tables in different schemas. 

# 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
🐆 In SQL, two key types commonly used to uniquely identify rows and define relationships are: Primary Key and Foreign Key.
1. Primary Key- To find each row uniquely, every table has a key column and it contains unique id for each row which is called primary key. 
Example: Below "rangers" table "ranger_id" is primary key

rangers Table                          
| ranger_id | name             | 
|-----------|------------------|
| 1         | Alice Green      | 
| 2         | Bob White        | 
| 3         | Carol King       | 

2. Foreign Key- Foreign key also indetified a row uniquely but not the table where it placed but another table, on which table it is also a primary key. It's main purpose is to build connection between those two respective tables.
Example: Below "sightings" table "ranger_id" is foreign key

sightings Table
| sighting_id | ranger_id | location          | 
|-------------|-----------|-------------------|
| 1           | 1         | Peak Ridge        | 
| 2           | 2         | Bankwood Area     | 
| 3           | 3         | Bamboo Grove East | 
| 4           | 2         | Snowfall Pass


# 4. What is the difference between the VARCHAR and CHAR data types?
🐆 VARCHAR and CHAR are 2 variation of character type data, like string in JavaScript. Below are there few differences:

- CHAR is a fixed length character type. It's length is fixed and specified when defining the column. If the actual string is shorter than the specified length, it is padded with spaces. Example- CHAR(10) means a fixed-length string of 10 characters

- VARCHAR is a variable-length chracter type. The length is not fixed and can vary up to the specified maximum length. No padding with spaces is done, so it is more storage-efficient when dealing with variable-length strings. Example- VARCHAR(255) means variable-length string with a maximum length of 255 characters. 


# 6. What are the LIMIT and OFFSET clauses used for?
🐆 When we need to specified which and how much data or how much row we need to get from the begining, we used LIMIT, and when specified from where and how much row we need to get we used LIMIT & OFFSET combinedly. Practical uses of these clause are in Pagination.

# 7. How can you modify data using UPDATE statements?
🐆 Explained below how to modify data using UPDATE statement; 

        UPDATE persons - first write UDATE clause then table name

        set country = 'Bangladesh', age = 30 - write set and which column to change, 
        then the new data. single or multiple data can change at a time.

        WHERE person_id = 10; - write WHERE clause and primary key column name, then respective primary key
