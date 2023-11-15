CREATE DATABASE petmeds_db;
CREATE TABLE medications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
INSERT INTO medications (name, description, price)
VALUES
    ('Medication 1', 'Description for Medication 1', 10.99),
    ('Medication 2', 'Description for Medication 2', 15.99),
    ('Medication 3', 'Description for Medication 3', 8.49);
