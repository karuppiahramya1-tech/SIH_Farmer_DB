USE FarmerDB;

INSERT INTO Members(member_name,phone,village)
VALUES
('Ravi','9876543210','Village A'),
('Priya','9876543211','Village B'),
('Kumar','9876543212','Village C'),
('Anitha','9876543213','Village D');

INSERT INTO Produce(produce_name)
VALUES
('Rice'),
('Wheat'),
('Corn');

INSERT INTO Rate(produce_id,rate,effective_date)
VALUES
(1,45,'2026-07-01'),
(2,35,'2026-07-01'),
(3,25,'2026-07-01');

INSERT INTO Collection(member_id,produce_id,collection_date,quantity)
VALUES
(1,1,'2026-07-20',120),
(2,2,'2026-07-20',80),
(1,3,'2026-07-21',50),
(3,1,'2026-07-22',100);