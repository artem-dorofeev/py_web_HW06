-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів
SELECT s.fullname as Name, ROUND(AVG(g.grade), 2) as Grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
GROUP BY s.fullname
ORDER BY Grade DESC
LIMIT 5;