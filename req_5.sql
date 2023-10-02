-- Знайти які курси читає певний викладач
SELECT d.name AS Disc_name, t.fullname AS Teacher 
FROM disciplines d
JOIN teachers t ON t.id = d.teacher_id  
WHERE t.id = 2
ORDER BY d.name;