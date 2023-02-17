import os

from datetime import timedelta

from flask_swagger import swagger
from flask import Flask, jsonify, render_template
from flask_login import LoginManager, current_user

from flask_socketio import SocketIO
from flask_socketio import send, emit
from flask_socketio import join_room, leave_room, close_room

from CRUD.Login import get_by_user_id
from database_config import Patient, Doctor

from pony.flask import Pony

from swagger_ui import api_doc

from RESTAPI.Patient import patient_crud_blueprint
from RESTAPI.Doctor import doctor_crud_blueprint
from RESTAPI.Login import login_restapi_blueprint
from RESTAPI.User import user_crud_blueprint

# Flask settings
app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'

socketio = SocketIO(app)

api_doc(app, config_path='./config/test.yaml', url_prefix='/api/swagger', title='API doc', editor=True)

Pony(app)

app.register_blueprint(patient_crud_blueprint)
app.register_blueprint(doctor_crud_blueprint)
app.register_blueprint(login_restapi_blueprint)
app.register_blueprint(user_crud_blueprint)

connected_doctors={}

def is_doctor_online(id):
    return connected_doctors.get(id, False)


@socketio.on('message')
def handle_message(data):
    send(data)
    print('received message: ' + data)


@socketio.on('connect')
def test_connect(auth):
    if current_user.is_authenticated:
        user=get_by_user_id(current_user.get_id())

        if type(user) is Doctor:
            connected_doctors[int(user["doctor_id"])]=user
        else:
            if connected_doctors.get(user.doctor):
                join_room(f"{user.patient_id}")
                send('user f{user.login} is connected')
    else:
        return False
    emit('my response', {'data': 'Connected'})


@socketio.on('disconnect')
def test_disconnect():
    if current_user.is_authenticated:
        user=get_by_user_id(current_user.get_id())

        if type(user) is Doctor:
            connected_doctors.pop(int(user["doctor_id"]))
        else:
            if connected_doctors.get(user.doctor):
                close_room(f"{user.patient_id}")
                send('user f{user.login} is disconnected')
    print('Client disconnected')


app.config['RESTPLUS_MASK_SWAGGER'] = False
# app.config['TESTING'] = True
# app.config['LOGIN_DISABLED'] = True

# login settings
REMEMBER_COOKIE_DURATION = timedelta(minutes=60)
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.session_protection = "strong"
login_manager.login_view = "/api/login"
login_manager.login_message_category = "info"

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
    socketio.run(app)
