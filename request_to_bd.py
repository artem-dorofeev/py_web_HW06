import sqlite3
from pprint import pprint


def main(request):
    connection = sqlite3.connect('hw.db')
    cursor = connection.cursor()

    with open(request, 'r') as f:
        sql_request = f.read()
    cursor.execute(sql_request)
    results = cursor.fetchall()
    # for i in results:
    #     print(i)
    pprint(results)
    connection.commit()
    cursor.close()
    connection.close()


if __name__ == '__main__':
    # req = 'req_1.sql' # Знайти 5 студентів із найбільшим середнім балом з усіх предметів
    # req = 'req_2.sql' # Знайти студента із найвищим середнім балом з певного предмета
    # req = 'req_3.sql'  # Знайти середній бал у групах з певного предмета
    # req = 'req_4.sql'  # Знайти середній бал на потоці (по всій таблиці оцінок)
    # req = 'req_5.sql'  # Знайти які курси читає певний викладач
    # req = 'req_6.sql'  # Знайти список студентів у певній групі
    # req = 'req_7.sql' # Знайти оцінки студентів у окремій групі з певного предмета
    # req = 'req_8.sql' # Знайти середній бал, який ставить певний викладач зі своїх предметів
    # req = 'req_9.sql'  # Знайти список курсів, які відвідує студент
    # req = 'req_10.sql'  # Список курсів, які певному студенту читає певний викладач
    req = 'req_11.sql'  # Середній бал, який певний викладач ставить певному студентові
    main(req)
