CREATE DATABASE IF NOT EXISTS FarmerDB;
USE FarmerDB;

CREATE TABLE Members(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    village VARCHAR(100)
);

CREATE TABLE Produce(
    produce_id INT AUTO_INCREMENT PRIMARY KEY,
    produce_name VARCHAR(100) NOT NULL
);

CREATE TABLE Rate(
    rate_id INT AUTO_INCREMENT PRIMARY KEY,
    produce_id INT NOT NULL,
    rate DECIMAL(10,2) NOT NULL CHECK(rate>0),
    effective_date DATE NOT NULL,
    FOREIGN KEY(produce_id) REFERENCES Produce(produce_id)
);

CREATE TABLE Collection(
    collection_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    produce_id INT NOT NULL,
    collection_date DATE NOT NULL,
    quantity DECIMAL(10,2) NOT NULL CHECK(quantity>0),
    FOREIGN KEY(member_id) REFERENCES Members(member_id),
    FOREIGN KEY(produce_id) REFERENCES Produce(produce_id)
);