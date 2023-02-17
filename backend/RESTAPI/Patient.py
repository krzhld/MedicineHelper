from CRUD.Patient import *
from flask import request, make_response, Blueprint
from flask_login import current_user, login_required

patient_crud_blueprint = Blueprint('patient_crud_blueprint', __name__)


@patient_crud_blueprint.route("/api/patient/<int:id>", methods=['GET', 'POST', 'DELETE'])
def restapi_patient(id):
    if request.method == 'GET':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            return get_patient(id)
        else:
            return make_response(403)
    elif request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            data = request.get_json(force=True)
            update_patient(**data)
            return make_response(200)
        else:
            return make_response(403)
    elif request.method == 'DELETE':
        if current_user.role == 'Admin':
            return delete_patient(id)
        else:
            return make_response(403)


@patient_crud_blueprint.route("/api/patient", methods=['GET', 'POST'])
def restapi_patients():
    if request.method == 'GET':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            return get_patients()
        else:
            return make_response(403)
    elif request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            data = request.get_json(force=True)
            return create_patient(**data)
        else:
            return make_response(403)
