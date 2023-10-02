-- Знайти оцінки студентів у окремій групі з певного предмета
SELECT s.fullname  AS Student__name, gr.name AS Group_name, d.name AS Discipline, g.grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id
WHERE d.id  = 7 AND gr.id = 1
GROUP BY s.fullname 
ORDER BY s.fullname;