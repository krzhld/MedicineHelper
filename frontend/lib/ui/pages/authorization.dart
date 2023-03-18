// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:MedicineHelper/ui/pages/registration_patient.dart';
import 'package:MedicineHelper/ui/pages/registration_doctor.dart';
import 'package:MedicineHelper/ui/pages/patient.dart';
import 'package:MedicineHelper/ui/pages/doctor.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  var client = http.Client();
  late String login;
  late String password;
  var _answer;
  // ignore: non_constant_identifier_names
  final TextEditingController _login_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();

  Future<int> loginPost(String login, String password) async {
    var url = Uri.http('clinic.ferrion.tech/api/login');
    var response =
        await client.post(url, body: {'login': login, 'password': password});
    return response.statusCode;
  }

  @override
  void initState() {
    super.initState();
    _login_controller.addListener(() {
      final String text = _login_controller.text;
      _login_controller.value = _login_controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _password_controller.addListener(() {
      final String text = _password_controller.text;
      _password_controller.value = _password_controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Медицинский помощник")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              child: TextFormField(
                controller: _login_controller,
                decoration: const InputDecoration(
                    labelText: "Логин", border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => login = value,
              ),
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                controller: _password_controller,
                decoration: const InputDecoration(
                    labelText: "Пароль", border: OutlineInputBorder()),
                obscureText: true,
                onChanged: (value) => password = value,
              ),
            ),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Войти"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Patient()));
                  },
                  onLongPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Doctor()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Зарегестрироваться пациенту"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationPatient()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Зарегестрироваться врачу"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationDoctor()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
