import 'package:flutter/material.dart';
import 'package:medicine_helper/ui/pages/doctor_personal_account.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medicine_helper/ui/pages/choice_a_chat_with_a_patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

bool _isShowHealthData = false;
bool _isShowDropdownPatients = false;

var maskFormatterPressure = MaskTextInputFormatter(
    mask: '###/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _Doctor();
}

class _Doctor extends State<Doctor> {
  final client = http.Client();
  final uri = Uri.parse('http://clinic.ferrion.tech/api/patient');

  var _patientsJson = [];

  void fetchPatients() async {
    try {
      final response = await client.get(uri);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _patientsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Страница врача")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(400, 10, 400, 10),
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
                        builder: (context) => DoctorPersonalAccount()));
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Просмотр данных пациента"),
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
                _isShowHealthData ? 'Скрыть' : 'Внесите данные пациента',
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
            child: const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Фамилия пациента"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Имя пациента"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Отчество пациента"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const Text(
              'Давление:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterPressure],
                  decoration:
                      const InputDecoration(labelText: "Минимальное значение"),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterPressure],
                  decoration:
                      const InputDecoration(labelText: "Максимальное значение"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const Text(
              'Пульс:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: Column(
              children: const <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Минимальное значение"),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Максимальное значение"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const Text(
              'Сатурация:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: Column(
              children: const <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Минимальное значение"),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Максимальное значение"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: OutlinedButton(
              child: const Text("Задать значения"),
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
                _isShowDropdownPatients ? 'Скрыть' : 'Записать пациента',
              ),
              onPressed: () {
                setState(
                  () {
                    _isShowDropdownPatients = !_isShowDropdownPatients;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowDropdownPatients,
            child: Text(
              'Выберите пациента: $_patientsJson',
              style: const TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          // const SizedBox(height: 10),
          // Visibility(
          //   visible: _isShowDropdownPatients,
          //   child: const DropdownPatients(),
          // ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowDropdownPatients,
            child: OutlinedButton(
              child: const Text("Записать"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Коммуникация с пациентом"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChoiceChatWithPatient()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
