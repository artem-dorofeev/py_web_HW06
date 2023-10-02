-- Список курсів, які певному студенту читає певний викладач
SELECT d.name AS Discipline, s.fullname  AS Student, t.fullname AS Teacher
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE s.id  = 45 
GROUP BY d.name
ORDER BY t.fullname;