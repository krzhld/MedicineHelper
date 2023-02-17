from flask import make_response, render_template, request, flash, redirect, Blueprint, send_from_directory
from flask_login import login_required, login_user, logout_user, current_user
from CRUD.Login import *
from datetime import datetime, timedelta
import database_config as db

login_restapi_blueprint = Blueprint('login_blueprint', __name__)


@login_restapi_blueprint.route('/api/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            json = request.get_json()
            login = json['login']
            password = json['password']
            possible_user = get_user(login)
            if not possible_user:
                flash('Wrong login')
                return redirect('/api/login')
            if possible_user.password == password:
                possible_user.last_login = datetime.now()
                login_user(possible_user, duration=timedelta(minutes=60))
                return redirect('/api/profile/{login}')
            flash('Wrong password')
            return redirect('/api/login')
        else:
            return make_response(403)
    else:
        return send_from_directory('page_templates', 'login_page.html')



@login_restapi_blueprint.route('/api/registration', methods=['GET', 'POST'])
def registration():
    if request.method == 'POST':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            json = request.get_json()
            exist = db.User.get(login=json['login'])

            if exist:
                flash('This login is already taken, choose another one')
                return redirect('/api/registration')

            exist=create_user(json['login'], json['password'])

            if exist:
                flash('Successfully registered')

                login_user(exist, duration=timedelta(minutes=60))
                return redirect('/api/profile/{login}')
            else:
                flash('Registration falled')
                return redirect('/api/registration')
        else:
            return make_response(403)
    else:
        return render_template('registration.html')


@login_restapi_blueprint.route('/api/profile/<string:login>', methods=['GET', 'POST'])
def profile(login):
    if request.method == 'GET':
        if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
            return True
        else:
            return make_response(403)


@login_restapi_blueprint.route('/api/logout')
@login_required
def logout():
    if current_user.role == 'Patient' or current_user.role == 'Doctor' or current_user.role == 'Admin':
        logout_user()
        flash('Logged out')
        return redirect('/')
    else:
        return make_response(403)

