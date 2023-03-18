import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationDoctor extends StatefulWidget {
  const RegistrationDoctor({super.key});

  @override
  State<RegistrationDoctor> createState() => _RegistrationDoctorState();
}

class _RegistrationDoctorState extends State<RegistrationDoctor> {
  late String login;
  late String password;
  late String password_again;
  final TextEditingController _login_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _password_again_controller =
      TextEditingController();

  Future<http.Response> createAccount(String login, String password) {
    return http.post(
      Uri.parse('registration'),
      headers: {'Accept': 'application/json'},
      body: jsonEncode({'login': login, 'password': password}),
    );
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
    _password_again_controller.addListener(() {
      final String text = _password_again_controller.text;
      _password_again_controller.value =
          _password_again_controller.value.copyWith(
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
              controller: _login_controller,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              controller: _password_controller,
              decoration: const InputDecoration(
                  labelText: 'Пароль', border: OutlineInputBorder()),
              obscureText: true,
              onChanged: (value) => password = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              controller: _password_again_controller,
              decoration: const InputDecoration(
                  labelText: 'Повторите пароль', border: OutlineInputBorder()),
              obscureText: true,
              onChanged: (value) => password_again = value,
            ),
          ),
          SizedBox(
              width: 400.0,
              height: 50.0,
              child: OutlinedButton(
                child: const Text('Зарегистрироваться'),
                onPressed: () {
                  if (password != password_again) {
                    null;
                  } else {
                    createAccount(login, password);
                  }
                },
              )),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("На главную"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
