-- Знайти студента із найвищим середнім балом з певного предмета
SELECT d.name as Discipline, s.fullname, ROUND(AVG(g.grade), 2) as Average_grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id = g.discipline_id
WHERE d.id = 7
-- WHERE d.id = 1 - вибір дисципліни
GROUP BY s.fullname
ORDER BY average_grade DESC
LIMIT 1;