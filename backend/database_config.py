from datetime import datetime, date

from flask_login import UserMixin
from pony.orm import *
from pony.orm import Database

db: Database = Database()
db.bind(provider='sqlite', filename='database.sqlite', create_db=True)
set_sql_debug(True)


class Doctor(db.Entity):
    doctor_id = PrimaryKey(int, auto=True)
    name = Optional(str)
    surname = Optional(str)
    patronymic = Optional(str)
    specialization = Optional(str)
    patients = Set('Patient', reverse='doctors')
    user = Required(int)


class Patient(db.Entity):
    patient_id = PrimaryKey(int, auto=True)
    name = Optional(str)
    surname = Optional(str)
    patronymic = Optional(str)
    birth_date = Optional(date)
    sex = Optional(str)
    growth = Optional(float)
    weight = Optional(float)
    doctors = Set('Doctor', reverse='patients')
    blood_characteristics = Set('PatientBloodCharacteristics', reverse='patient')
    user = Required(int)


class PatientBloodCharacteristics(db.Entity):
    characteristic_id = PrimaryKey(int, auto=True)
    measure_datetime = Optional(datetime)
    pulse = Optional(int)
    diastolic_pressure = Optional(int)
    systolic_pressure = Optional(int)
    saturation = Optional(float)
    patient = Required('Patient', reverse='blood_characteristics')


class User(db.Entity, UserMixin):
    user_id = PrimaryKey(int, auto=True)
    login = Required(str, unique=True, nullable=False)
    password = Required(str, nullable=False)
    role = Required(str, nullable=False)
    last_login = Optional(datetime, nullable=True)
    

db.generate_mapping(create_tables=True)
