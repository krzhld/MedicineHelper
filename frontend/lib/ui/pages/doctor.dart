import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/doctor_personal_account.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:MedicineHelper/ui/pages/choice_a_chat_with_a_patient.dart';
import 'package:MedicineHelper/ui/pages/interaction_with_patient.dart';
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
                        builder: (context) => DoctorPersonalAccount()));
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: Text(
                _isShowDropdownPatients ? 'Скрыть' : 'Выбрать пациента',
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
              child: const Text("Взаимодействие с пациентом"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InteractionWithPatient()));
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Коммуникация с пациентами"),
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
