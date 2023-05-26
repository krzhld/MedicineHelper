from CRUD.Doctor import *
from CRUD.Patient import *
from flask_login import current_user


def set_doctor_for_patient(id=None):
    if current_user.role == 'Patient':
        if id is not None:
            doctor = get_doctor(id)
            current_user.doctors.set(doctor)
            doctor.patients.set(current_user)
            return make_response(200)
     else:
        return make_response(403)   
        

def set_patient_for_doctor(id=None):
    if current_user.role == 'Doctor':
        if id is not None:
            patient = get_patient(id)
            current_user.patients.set(patient)
            patient.doctors.set(current_user)
            return make_response(200)
     else:
        return make_response(403)   
        
        