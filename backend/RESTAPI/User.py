from CRUD.Login import *
from flask import request, make_response, Blueprint
from flask_login import current_user, login_required

user_crud_blueprint = Blueprint('user_crud_blueprint', __name__)


@user_crud_blueprint.route("/api/users/<int:userId>", methods=['GET', 'POST', 'DELETE'])
def restapi_user(userId):
    if request.method == 'GET':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            return get_user(id)
        else:
            return make_response(403)
    elif request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            data = request.get_json(force=True)
            update_user(**data)
            return make_response(200)
        else:
            return make_response(403)
    elif request.method == 'DELETE':
        if current_user.role == 'Admin':
            return delete_user(id)
        else:
            return make_response(403)


@user_crud_blueprint.route("/api/user", methods=['POST'])
def restapi_users():
    if request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            data = request.get_json(force=True)
            return create_user(**data)
        else:
            return make_response(403)