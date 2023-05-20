from flask import request, make_response, Blueprint
from flask_login import current_user, login_required
from CRUD.Doctor import *
# from CRUD.socket_manager import *

doctor_crud_blueprint = Blueprint('doctor_crud_blueprint', __name__)



@doctor_crud_blueprint.route("/api/doctor/<int:id>", methods=['GET', 'POST', 'DELETE'])
def restapi_doctor(id):
    if request.method == 'GET':
        return get_doctor(id)
    elif request.method == 'POST':
        if current_user.role != 'Patient' and (current_user.role == 'Doctor' or current_user.role == 'Admin'):
            data = request.get_json(force=True)
            update_doctor(**data)
            return make_response(200)
        else:
            return make_response(403)
    elif request.method == 'DELETE':
        if current_user.role == 'Admin':
            return delete_doctor(id)
        else:
            return make_response(403)


@doctor_crud_blueprint.route("/api/doctor", methods=['GET', 'POST'])
def restapi_doctors():
    if request.method == 'GET':
        return get_doctors()
    elif request.method == 'POST':
        if current_user.role != 'Patient' and (current_user.role == 'Doctor' or current_user.role == 'Admin'):
            data = request.get_json(force=True)
            return create_doctor(**data)
        else:
            return make_response(403)
