# Farmer Producer Group Produce Collection and Payment System

## About the Project


The aim of this project is to replace the manual slip-based collection process used in Farmer Producer Groups with a simple database system. The database records each farmer's produce delivery and calculates the payment amount automatically using the stored rate.

The project is implemented using MySQL and executed in Visual Studio Code with SQLTools.

---

## Problem Statement

In many Farmer Producer Groups, produce collection is recorded manually on paper slips. While calculating payments, these slips are checked one by one, which takes time and sometimes creates confusion if the recorded quantity does not match what the farmer remembers.

This project stores every collection digitally so that all deliveries and payments can be viewed whenever required.

---

## Software Used

- MySQL
- Visual Studio Code
- SQLTools Extension
- GitHub
- draw.io

---

## Database Tables

### Members

Stores farmer details.

Fields:

- member_id
- member_name
- phone
- village

---

### Produce

Stores different produce names.

Fields:

- produce_id
- produce_name

---

### Rate

Stores the current rate for each produce.

Fields:

- rate_id
- produce_id
- rate
- effective_date

---

### Collection

Stores every produce delivery made by a farmer.

Fields:

- collection_id
- member_id
- produce_id
- collection_date
- quantity

---

## Constraints Used

To avoid invalid data, the following constraints were used:

- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- CHECK(quantity > 0)
- CHECK(rate > 0)

These constraints ensure that incorrect records cannot be inserted into the database.

---

## Files Included

### schema.sql

Creates the database and all required tables.

### seed.sql

Inserts sample data into all tables.

### queries.sql

Contains the queries used to generate reports and payment calculations.

## explain before.png & explain after.png

This explains the changes before and after explain command in queries.sql

---

## Queries Implemented

The following SQL queries were written:

- Display all members
- Display collection details
- Calculate payment for each collection
- Calculate total payment for every farmer
- Calculate total quantity delivered
- Display members who have not delivered produce
- Sort farmers based on total payment

## Query Optimization

I used the EXPLAIN statement to check the execution plan of the total payment query.

Initially, the query worked correctly but scanned more data while joining tables. After creating indexes on member_id and produce_id in the Collection table, I executed the EXPLAIN statement again. The execution became more efficient because MySQL could use the indexes while performing joins.

---

## Testing

I tested the project with both valid and invalid inputs.

The following validations were checked:

- Quantity should not be zero.
- Invalid member IDs should not be accepted.
- Foreign key relationships should be maintained.
- Valid records should insert successfully.

I also verified one payment manually by multiplying the quantity with the rate and comparing it with the query result.

---

## ER Diagram

The ER diagram shows the relationship between Members, Produce, Rate and Collection tables.



## Conclusion

This project successfully stores farmer collection details in a structured database and calculates payments automatically. Compared to maintaining paper slips, the database provides faster access to records, improves accuracy and makes payment calculation easier.

