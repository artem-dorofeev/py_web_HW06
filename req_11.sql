-- Середній бал, який певний викладач ставить певному студентові
SELECT t.fullname  AS Teacher, d.name AS Discipline, s.fullname AS Student, ROUND(AVG(g.grade), 2) as Avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE d.teacher_id = 2 AND g.student_id = 10
GROUP BY g.discipline_id
ORDER BY d.name;