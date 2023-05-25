// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MedicineHelper/services/snack_bar.dart';
import 'package:MedicineHelper/ui/pages/registration_patient.dart';
import 'package:MedicineHelper/ui/pages/registration_doctor.dart';
import 'package:MedicineHelper/ui/pages/patient.dart';
import 'package:MedicineHelper/ui/pages/doctor.dart';

var users_ref = FirebaseFirestore.instance.collection('users');
var doctors_ref = FirebaseFirestore.instance.collection('doctors');

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    //final navigator = Navigator.of(context);

    // final isValid = formKey.currentState!.validate();
    // if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    final user = FirebaseAuth.instance.currentUser;
    final query = users_ref.where('email', isEqualTo: user?.email);
    query.get().then((querySnapshot) {
      var docSnapshot = querySnapshot.docs[0];
      log(docSnapshot.data().toString());
      if (docSnapshot.data()['role'] == 'doctor') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Doctor()));
      } else if (docSnapshot.data()['role'] == 'patient') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Patient()));
      }
    });
    //navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Войти")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: emailTextInputController,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
                        : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите Email',
                ),
              ),
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                autocorrect: false,
                controller: passwordTextInputController,
                obscureText: isHiddenPassword,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Введите пароль',
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Сбросить пароль"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/reset_password'),
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  onPressed: login,
                  child: const Text("Войти"),
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Зарегистрироваться пациенту"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/registration_patient'),
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Зарегистрироваться врачу"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/registration_doctor'),
                )),
          ],
        ),
      ),
    );
  }
}
