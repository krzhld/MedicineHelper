import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:MedicineHelper/ui/widgets/dropdown_button_gender.dart';
import 'package:flutter/services.dart';

class RegistrationPatient extends StatefulWidget {
  const RegistrationPatient({super.key});

  @override
  State<RegistrationPatient> createState() => _RegistrationPatientState();
}

var maskFormatterDate = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class _RegistrationPatientState extends State<RegistrationPatient> {
  late String login;
  late String password;
  late String password_again;
  final TextEditingController _login_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _password_again_controller =
      TextEditingController();

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
      appBar: AppBar(title: const Text('Регистрация пациента')),
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
              keyboardType: TextInputType.datetime,
              inputFormatters: [maskFormatterDate],
              //  controller: _login_controller,
              decoration: const InputDecoration(
                  labelText: 'Дата рождения', border: OutlineInputBorder()),
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
            child: Text(
              'Дополнительные параметры:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: Text(
              'Пол:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: DropdownButtonGender(),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              // controller: _login_controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  helperText: 'Вводите только цифры',
                  labelText: 'Рост',
                  border: OutlineInputBorder()),
              // onChanged: (value) => login = value,
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              // controller: _login_controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  helperText: 'Вводите только цифры',
                  labelText: 'Вес',
                  border: OutlineInputBorder()),
              // onChanged: (value) => login = value,
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
                    null;
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
