-- Change 1 & 2
SELECT m.member_id, m.member_name
FROM Members m
LEFT JOIN Collection c ON m.member_id = c.member_id
WHERE c.member_id IS NULL;

SELECT p.produce_id, p.produce_name
FROM Produce p
LEFT JOIN Rate r ON p.produce_id = r.produce_id
WHERE r.produce_id IS NULL;

SELECT m.member_id, m.member_name
FROM Members m
WHERE NOT EXISTS (
    SELECT 1 FROM Collection c WHERE c.member_id = m.member_id
);

-- Change 3
UPDATE Rate SET rate = 60.00 WHERE produce_id = 1;
SELECT * FROM Rate;

-- Change 4
DELETE FROM Collection WHERE member_id = 2;
SELECT * FROM Collection;

-- Final Report
SELECT m.member_name, p.produce_name, c.quantity, c.collection_date
FROM Members m
JOIN Collection c ON m.member_id = c.member_id
JOIN Produce p ON c.produce_id = p.produce_id;
