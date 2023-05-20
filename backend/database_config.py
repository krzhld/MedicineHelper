from datetime import date
from datetime import datetime
from pony.orm import *
from flask_login import UserMixin


db: Database = Database()
db.bind(provider='sqlite', filename='database.sqlite', create_db=True)
set_sql_debug(True)


class Doctor(db.Entity):
    doctor_id = PrimaryKey(int, auto=True)
    name = Optional(str)
    surname = Optional(str)
    patronymic = Optional(str, nullable=True)
    specialization = Optional(str)
    profile_picture_link = Optional(str, nullable=True)
    rating = Optional(float)
    amount_of_appointments = Optional(int)
    achievementss = Set('Achievements')
    recomendations = Set('Recomendation')
    appointments = Set('Appointment')
    user = Required('User')


class Achievements(db.Entity):
    achievement_id = PrimaryKey(int, auto=True)
    link = Optional(str, nullable=True)
    achievement_type = Optional(str)
    description = Optional(str, nullable=True)
    is_approved = Optional(bool)
    doctor = Required(Doctor)


class User(db.Entity, UserMixin):
    user_id = PrimaryKey(int, auto=True)
    email = Optional(str)
    hash_password = Optional(str)
    role = Optional(str)
    status = Optional(str)
    last_login = Optional(datetime)
    doctor = Optional(Doctor)
    patient = Optional('Patient')


class Patient(db.Entity):
    patient_id = PrimaryKey(int, auto=True)
    name = Optional(str)
    surname = Optional(str)
    patronymic = Optional(str)
    profile_picture_link = Optional(str, nullable=True)
    birth_date = Optional(date)
    sex = Optional(bool)
    growth = Optional(int)
    weight = Optional(int)
    rating = Optional(float)
    amount_of_appointments = Optional(int)
    recomendations = Set('Recomendation')
    appointments = Set('Appointment')
    user = Required(User)
    med_characteristics = Set('Med_characteristic')


class Appointment(db.Entity):
    appointment_id = PrimaryKey(int, auto=True)
    location = Optional(str, nullable=True)
    datetime = Optional(datetime)
    duration = Optional(int)
    description = Optional(str, nullable=True)
    status = Optional(str)
    patient_comment = Optional(str, nullable=True)
    doctor_comment = Optional(str, nullable=True)
    evaluation_from_patient = Optional(int)
    evaluation_from_doctor = Optional(int)
    doctor = Required(Doctor)
    patient = Required(Patient)


class Recomendation(db.Entity):
    recomendation_id = PrimaryKey(int, auto=True)
    action = Optional(str)
    frequency = Optional(str, nullable=True)
    duration = Optional(str, nullable=True)
    description = Optional(str, nullable=True)
    doctor = Required(Doctor)
    patient = Required(Patient)


class Med_characteristic(db.Entity):
    characteristic_id = PrimaryKey(int, auto=True)
    datetime_measurement = Optional(datetime)
    pulse = Optional(int)
    systolic_pressure = Optional(int)
    diastolic_pressure = Optional(int)
    saturation = Optional(float)
    comment = Optional(str, nullable=True)
    patient = Required(Patient)



db.generate_mapping()
