-- Знайти список курсів, які відвідує студент
SELECT d.name AS Discipline, s.fullname  AS Student
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id 
WHERE s.id  = 45 
GROUP BY d.name
ORDER BY d.name;