-- Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT t.fullname  AS Teacher, d.name AS Discipline, ROUND(AVG(g.grade), 2) as Avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE d.teacher_id = 2
GROUP BY g.discipline_id
ORDER BY d.name;