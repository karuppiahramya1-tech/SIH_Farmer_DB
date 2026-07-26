-- 1. View all members
SELECT * FROM Members;

-- 2. View all produce
SELECT * FROM Produce;

-- 3. View all collections
SELECT * FROM Collection;

-- 4. Show every collection with member name and produce name
SELECT
    m.member_name,
    p.produce_name,
    c.quantity,
    c.collection_date
FROM Collection c
JOIN Members m ON c.member_id = m.member_id
JOIN Produce p ON c.produce_id = p.produce_id;

-- 5. Calculate payment for every collection
SELECT
    m.member_name,
    p.produce_name,
    c.quantity,
    r.rate,
    (c.quantity * r.rate) AS amount
FROM Collection c
JOIN Members m ON c.member_id = m.member_id
JOIN Produce p ON c.produce_id = p.produce_id
JOIN Rate r ON c.produce_id = r.produce_id;

-- 6. Total payment of each farmer (Aggregate)
SELECT
    m.member_name,
    SUM(c.quantity * r.rate) AS total_payment
FROM Collection c
JOIN Members m ON c.member_id = m.member_id
JOIN Rate r ON c.produce_id = r.produce_id
GROUP BY m.member_name;

-- 7. Members with no collection (LEFT JOIN)
SELECT
    m.member_name
FROM Members m
LEFT JOIN Collection c
ON m.member_id = c.member_id
WHERE c.collection_id IS NULL;

-- 8. Total quantity collected from each farmer
SELECT
    m.member_name,
    SUM(c.quantity) AS total_quantity
FROM Members m
LEFT JOIN Collection c
ON m.member_id = c.member_id
GROUP BY m.member_name;

-- 9. Farmers ordered by highest payment
SELECT
    m.member_name,
    SUM(c.quantity * r.rate) AS total_payment
FROM Collection c
JOIN Members m ON c.member_id = m.member_id
JOIN Rate r ON c.produce_id = r.produce_id
GROUP BY m.member_name
ORDER BY total_payment DESC;


EXPLAIN
SELECT
    m.member_name,
    SUM(c.quantity * r.rate) AS total_payment
FROM Collection c
JOIN Members m
ON c.member_id = m.member_id
JOIN Rate r
ON c.produce_id = r.produce_id
GROUP BY m.member_name;



CREATE INDEX idx_collection_member2
ON Collection(member_id);

CREATE INDEX idx_collection_produce2
ON Collection(produce_id);



EXPLAIN
SELECT
    m.member_name,
    SUM(c.quantity * r.rate) AS total_payment
FROM Collection c
JOIN Members m
ON c.member_id = m.member_id
JOIN Rate r
ON c.produce_id = r.produce_id
GROUP BY m.member_name;
