DROP TABLE IF EXISTS Collection;
DROP TABLE IF EXISTS Rate;
DROP TABLE IF EXISTS Produce;
DROP TABLE IF EXISTS Members;

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    village VARCHAR(50)
);

CREATE TABLE Produce (
    produce_id INT PRIMARY KEY AUTO_INCREMENT,
    produce_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Rate (
    rate_id INT PRIMARY KEY AUTO_INCREMENT,
    produce_id INT,
    rate DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (produce_id) REFERENCES Produce(produce_id)
);

CREATE TABLE Collection (
    collection_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    produce_id INT,
    collection_date DATE,
    quantity DECIMAL(10,2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (produce_id) REFERENCES Produce(produce_id)
);
