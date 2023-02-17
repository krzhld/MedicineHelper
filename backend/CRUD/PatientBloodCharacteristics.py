from database_config import PatientBloodCharacteristics
from pony.orm import *


@db_session
def create_characteristic(measure_datetime, pulse, diastolic_pressure, systolic_pressure, saturation, **kwargs):
    return PatientBloodCharacteristics(measure_datetime=measure_datetime, pulse=pulse, 
    diastolic_pressure=diastolic_pressure, systolic_pressure=systolic_pressure,
    saturation=saturation, **kwargs).to_dict()


@db_session
def get_characteristic(id):
    return PatientBloodCharacteristics[id].to_dict()


@db_session
def get_characteristics():
    return [obj.to_dict() for obj in PatientBloodCharacteristics.select()]


@db_session
def update_characteristic(id, **kwargs):
    PatientBloodCharacteristics[id].set(**kwargs)


@db_session
def delete_characteristic(id):
    PatientBloodCharacteristics[id].delete()
