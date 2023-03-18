import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/patient_personal_account.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:MedicineHelper/ui/pages/choice_a_chat_with_a_doctor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var maskFormatterDate = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

var maskFormatterPressure = MaskTextInputFormatter(
    mask: '###/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

bool _isShowHealthData = false;
bool _isShowDropdownDoctors = false;

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _Patient();
}

class _Patient extends State<Patient> {
  final client = http.Client();
  final uri = Uri.parse('http://clinic.ferrion.tech/api/doctor');

  var _doctorsJson = [];

  void fetchDoctors() async {
    try {
      final response = await client.get(uri);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _doctorsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Страница пациента")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Выйти"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Личный кабинет"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientPersonalAcccount()));
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              // ignore: unnecessary_new
              child: new Text(
                _isShowHealthData
                    ? 'Скрыть'
                    : 'Внесите свои данные по состоянию здоровья',
              ),
              onPressed: () {
                setState(
                  () {
                    _isShowHealthData = !_isShowHealthData;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: TextField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [maskFormatterDate],
              decoration: const InputDecoration(labelText: "Дата"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Пульс"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatterPressure],
              decoration: const InputDecoration(labelText: "Давление"),
            ),
          ),
          Visibility(
            visible: _isShowHealthData,
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Сатурация"),
            ),
          ),
          Visibility(
            visible: _isShowHealthData,
            child: const TextField(
              maxLength: 1024,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText:
                      "Дополнительные комментарии (не более 1024 символов)"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: OutlinedButton(
              child: const Text("Сохранить"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Обработать имеющиеся данные"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: Text(
                _isShowDropdownDoctors ? 'Скрыть' : 'Записаться к врачу',
              ),
              onPressed: () {
                setState(
                  () {
                    _isShowDropdownDoctors = !_isShowDropdownDoctors;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowDropdownDoctors,
            child: Text(
              'Выберите врача:$_doctorsJson',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          // const SizedBox(height: 10),
          // Visibility(
          //   visible: _isShowDropdownDoctors,
          //   child: const DropdownDoctors(),
          // ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowDropdownDoctors,
            child: OutlinedButton(
              child: const Text("Записаться"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Коммуникация с врачом"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChoiceChatWithDoctor()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
