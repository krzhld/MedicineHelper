from database_config import Patient
from pony.orm import *


@db_session
def create_patient(name, surname, patronymic, birth_date, sex, growth, weight, **kwargs):
    return Patient(name=name, surname=surname, patronymic=patronymic,
    birth_date=birth_date, sex=sex, growth=growth, weight=weight, **kwargs).to_dict()


@db_session
def get_patient(id):
    return Patient[id].to_dict()


@db_session
def get_patients():
    return [obj.to_dict() for obj in Patient.select()]


@db_session
def update_patient(id, **kwargs):
    Patient[id].set(**kwargs)


@db_session
def delete_patient(id):
    patient = Patient[id].to_dict()
    Patient[id].delete()
    return patient
