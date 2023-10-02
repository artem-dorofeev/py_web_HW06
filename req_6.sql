--Знайти список студентів у певній групі
SELECT s.fullname AS Full_name, gr.name AS Group_Name 
FROM students s 
JOIN [groups] gr ON gr.id = s.group_id  
WHERE gr.id = 2
ORDER BY s.fullname;