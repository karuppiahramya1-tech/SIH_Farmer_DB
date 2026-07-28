-- Members
INSERT INTO Members (member_name, phone, village)
VALUES 
('Ravi', '9876543210', 'Kanchipuram'),
('Meena', '9123456789', 'Salem'),
('Arun', '9988776655', 'Chennai');

-- Constraint violation demo
INSERT INTO Members (member_name, phone, village)
VALUES ('DuplicateTest', '9876543210', 'Madurai');

-- Produce
INSERT INTO Produce (produce_name)
VALUES ('Rice'), ('Wheat'), ('Sugarcane');

-- Rates (Rice + Wheat only first)
INSERT INTO Rate (produce_id, rate, effective_date)
VALUES (1, 55.50, '2026-07-01'),
       (2, 40.00, '2026-07-01');

-- Collections (Ravi + Meena only first)
INSERT INTO Collection (member_id, produce_id, collection_date, quantity)
VALUES (1, 1, '2026-07-20', 100.00),
       (2, 2, '2026-07-21', 50.00);

-- Extra for Change 3 & 4
INSERT INTO Rate (produce_id, rate, effective_date)
VALUES (3, 30.00, '2026-07-01');

INSERT INTO Collection (member_id, produce_id, collection_date, quantity)
VALUES (3, 3, '2026-07-22', 70.00);
