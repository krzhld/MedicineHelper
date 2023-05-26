from flask import Flask, make_response, render_template
from flask import jsonify


app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html", h1 = "Главная страница")


@app.route("/contact")
def get_page_contact():
    # return render_template("contact.html", h1 = "О приложении")
    return make_response(jsonify(contact="O4en' zhestko"), 200)


if __name__ == "__main__":
    app.run(debug=False)


# import os

# from datetime import timedelta

# from flask_swagger import swagger
# from flask import Flask, jsonify, render_template
# from flask_login import LoginManager, current_user

# from CRUD.Login import get_by_user_id
# from database_config import Patient, Doctor

# from pony.flask import Pony

# from swagger_ui import api_doc

# from RESTAPI.Patient import patient_crud_blueprint
# from RESTAPI.Doctor import doctor_crud_blueprint
# from RESTAPI.Login import login_restapi_blueprint
# from RESTAPI.User import user_crud_blueprint

# # Flask settings
# app = Flask(__name__)
# app.config['SECRET_KEY'] = 'secret!'

# api_doc(app, config_path='./config/test.yaml', url_prefix='/api/swagger', title='API doc', editor=True)

# Pony(app)

# app.register_blueprint(patient_crud_blueprint)
# app.register_blueprint(doctor_crud_blueprint)
# app.register_blueprint(login_restapi_blueprint)
# app.register_blueprint(user_crud_blueprint)


# app.config['RESTPLUS_MASK_SWAGGER'] = False
# # app.config['TESTING'] = True
# # app.config['LOGIN_DISABLED'] = True

# # login settings
# REMEMBER_COOKIE_DURATION = timedelta(minutes=60)
# login_manager = LoginManager()
# login_manager.init_app(app)
# login_manager.session_protection = "strong"
# login_manager.login_view = "/api/login"
# login_manager.login_message_category = "info"

# # if __name__ == '__main__':
# #     app.run(debug=True)
