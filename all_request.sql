-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів
SELECT s.fullname as Name, ROUND(AVG(g.grade), 2) as Grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
GROUP BY s.fullname
ORDER BY Grade DESC
LIMIT 5;

-- Знайти студента із найвищим середнім балом з певного предмета
SELECT d.name as Discipline, s.fullname, ROUND(AVG(g.grade), 2) as Average_grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id = g.discipline_id
WHERE d.id = 1
GROUP BY s.fullname
ORDER BY average_grade DESC
LIMIT 1;

-- Знайти середній бал у групах з певного предмета
SELECT d.name as Discipline, gr.name, ROUND(AVG(g.grade), 2) as Average_grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id = g.discipline_id
JOIN [groups] gr ON gr.id = s.group_id 
WHERE d.id = 5
GROUP BY gr.name
ORDER BY average_grade DESC

-- Знайти середній бал на потоці (по всій таблиці оцінок)
SELECT ROUND(AVG(g.grade), 2) as Grade
FROM grades g 

-- Знайти які курси читає певний викладач
SELECT d.name AS Disc_name, t.fullname AS Teacher 
FROM disciplines d
JOIN teachers t ON t.id = d.teacher_id  
WHERE t.id = 2
ORDER BY d.name;

-- Знайти список студентів у певній групі
SELECT s.fullname AS Full_name, gr.name AS Group_Name 
FROM students s 
JOIN [groups] gr ON gr.id = s.group_id  
WHERE gr.id = 2
ORDER BY s.fullname;

-- Знайти оцінки студентів у окремій групі з певного предмета
SELECT s.fullname  AS Student__name, gr.name AS Group_name, d.name AS Discipline, g.grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id
WHERE d.id  = 7 AND gr.id = 1
GROUP BY s.fullname 
ORDER BY s.fullname;

-- Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT t.fullname  AS Teacher, d.name AS Discipline, ROUND(AVG(g.grade), 2) as Avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE d.teacher_id = 2
GROUP BY g.discipline_id
ORDER BY d.name;

-- Знайти список курсів, які відвідує студент
SELECT d.name AS Discipline, s.fullname  AS Student
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id 
WHERE s.id  = 45 
GROUP BY d.name
ORDER BY d.name;

-- Список курсів, які певному студенту читає певний викладач
SELECT d.name AS Discipline, s.fullname  AS Student, t.fullname AS Teacher
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE s.id  = 45 
GROUP BY d.name
ORDER BY t.fullname;

-- Середній бал, який певний викладач ставить певному студентові
SELECT t.fullname  AS Teacher, d.name AS Discipline, s.fullname AS Student, ROUND(AVG(g.grade), 2) as Avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE d.teacher_id = 2 AND g.student_id = 10
GROUP BY g.discipline_id
ORDER BY d.name;


