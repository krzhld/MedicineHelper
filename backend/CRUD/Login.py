from datetime import datetime
from database_config import User, Doctor, Patient
from flask_login import current_user, login_required, AnonymousUserMixin
from pony.orm import db_session, select


@db_session
def get_user(login=None, id=None):
    if login is not None:
        return User.get(login=login)
    elif id is not None:
        return User[id]


@db_session
def create_user(login, password, **kwargs):
    try:
        return User(login=login, password=password, role='Patient', last_login=datetime.now())
    except:
        return None


'''
@db_session
def update_users_role(id=None):
    if id is not None:
        User[id].set(role='doctor')
        return True
'''


@db_session
def update_user(id, **kwargs):
    User[id].set(**kwargs)
 
 
@db_session
def get_users():
    return [obj.to_dict() for obj in User.select()]


@db_session
def get_roles():
    return list(select(o.role for o in User))


@db_session
def get_by_user_id(id):
    if Doctor[id] is not None:
        return Doctor[id].to_dict()
    else:
        return Patient[id].to_dict()

@db_session
def delete_user(id):
    user = User[id].to_dict()
    User[id].delete()
    return user
