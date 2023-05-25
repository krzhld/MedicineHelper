import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/snack_bar.dart';

class RegistrationDoctor extends StatefulWidget {
  const RegistrationDoctor({super.key});

  @override
  State<RegistrationDoctor> createState() => _RegistrationDoctorState();
}

class _RegistrationDoctorState extends State<RegistrationDoctor> {
  bool isHiddenPassword = true;
  final TextEditingController emailTextInputController =
      TextEditingController();
  final TextEditingController passwordTextInputController =
      TextEditingController();
  final TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final TextEditingController nameTextInputController = TextEditingController();
  final TextEditingController surnameTextInputController =
      TextEditingController();
  final TextEditingController patronymicTextInputController =
      TextEditingController();
  final TextEditingController specializationTextInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();
    nameTextInputController.dispose();
    surnameTextInputController.dispose();
    patronymicTextInputController.dispose();
    specializationTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }

    final db = FirebaseFirestore.instance;
    final data = {
      "email": emailTextInputController.text,
      "name": nameTextInputController.text,
      "surname": surnameTextInputController.text,
      "patronymic": patronymicTextInputController.text,
      "specialization": specializationTextInputController.text,
    };

    db.collection("doctors").add(data);
    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация врача')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            width: 400.0,
            child: TextFormField(
              // controller: _login_controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Фамилия', border: OutlineInputBorder()),
              // onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              // controller: _login_controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Имя', border: OutlineInputBorder()),
              // onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              keyboardType: TextInputType.text,
              //  controller: _login_controller,
              decoration: const InputDecoration(
                  labelText: 'Отчество', border: OutlineInputBorder()),
              //  onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              keyboardType: TextInputType.text,
              //  controller: _login_controller,
              decoration: const InputDecoration(
                  labelText: 'Специализация', border: OutlineInputBorder()),
              //  onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              controller: emailTextInputController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Введите правильный Email'
                      : null,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              controller: passwordTextInputController,
              decoration: const InputDecoration(
                  labelText: 'Пароль', border: OutlineInputBorder()),
              obscureText: isHiddenPassword,
              validator: (value) => value != null && value.length < 6
                  ? 'Минимум 6 символов'
                  : null,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              controller: passwordTextRepeatInputController,
              decoration: const InputDecoration(
                  labelText: 'Повторите пароль', border: OutlineInputBorder()),
              obscureText: true,
              validator: (value) => value != null && value.length < 6
                  ? 'Минимум 6 символов'
                  : null,
            ),
          ),
          SizedBox(
              width: 400.0,
              height: 50.0,
              child: OutlinedButton(
                child: const Text('Зарегистрироваться'),
                onPressed: signUp,
              )),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("На главную"),
              onPressed: () => Navigator.of(context).pushNamed('/'),
            ),
          ),
        ],
      ),
    );
  }
}
