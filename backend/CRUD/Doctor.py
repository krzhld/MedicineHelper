from database_config import Doctor
from pony.orm import *


@db_session
def create_doctor(name, surname, patronymic, specialization, **kwargs):
    kwargs.pop("id")
    return Doctor(name=name, surname=surname, patronymic=patronymic,
    specialization=specialization, **kwargs).to_dict()


@db_session
def get_doctor(id):
    return Doctor[id].to_dict()


@db_session
def get_doctors():
    return [obj.to_dict() for obj in Doctor.select()]


@db_session
def update_doctor(id, **kwargs):
    Doctor[id].set(**kwargs)


@db_session
def delete_doctor(id):
    doctor=Doctor[id].to_dict()
    Doctor[id].delete()
    return doctor

