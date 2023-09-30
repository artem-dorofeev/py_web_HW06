from datetime import datetime, date, timedelta
import faker
from random import randint
import sqlite3
import pprint
from typing import List

from faker import Faker


disciplines = [
    "Програмування",
    "Історія України",
    "Теорія імовірності",
    "Креслення",
    "Економіка",
    "Англійська мова",
    "Філософія"
]

groups = ["РП-536", "РП-526", "РП-516"]

NUMBER_TEACHERS = 5
NUMBER_STUDENTS = 50

fake = Faker('uk-UA')
connect = sqlite3.connect('hw.db')
cursor = connect.cursor()


def seed_teachers():
    teachers = [fake.name() for _ in range(NUMBER_TEACHERS)]
    sql = "INSERT INTO teachers(fullname) VALUES (?);"
    print("teachers ok")
    cursor.executemany(sql, zip(teachers,))


def seed_disciplines():
    list_teacher_id = [randint(1, NUMBER_TEACHERS)
                       for _ in range(len(disciplines))]
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES (?, ?);"
    print("disciplines ok")
    cursor.executemany(sql, zip(disciplines, list_teacher_id))


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES (?);"
    print("groups ok")
    cursor.executemany(sql, zip(groups,))


def seed_students():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    list_group_id = [randint(1, len(groups))
                     for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES (?, ?);"
    print("students ok")
    cursor.executemany(sql, zip(students, list_group_id))


def seed_grades():
    start_date = datetime.strptime("2023-09-01", "%Y-%m-%d")
    finish_date = datetime.strptime("2024-06-20", "%Y-%m-%d")
    sql = "INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES (?, ?, ?, ?);"

    def get_list_of_dates(start_date, finish_date) -> List[date]:
        result = []
        current_day: date = start_date
        while current_day < finish_date:
            if current_day.isoweekday() < 6:
                result.append(current_day)
            current_day += timedelta(1)
        return result

    list_of_dates = get_list_of_dates(start_date, finish_date)

    grades = []
    for day in list_of_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_STUDENTS) for _ in range(7)]
        for student in random_students:
            grades.append((random_discipline, student,
                          randint(1, 12), day.date()))

    print("grades ok")
    cursor.executemany(sql, grades)


if __name__ == '__main__':
    try:
        seed_teachers()
        seed_disciplines()
        seed_groups()
        seed_students()
        seed_grades()
        connect.commit()
    except sqlite3.Error as error:
        # print('93')
        pprint.pprint(error)
    finally:
        connect.close()
