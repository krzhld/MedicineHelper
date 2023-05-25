import 'package:MedicineHelper/models/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/doctor_personal_account.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:MedicineHelper/ui/pages/choice_a_chat_with_a_patient.dart';
import 'package:MedicineHelper/ui/pages/interaction_with_patient.dart';

bool _isShowHealthData = false;
bool _isShowDropdownPatients = false;

var maskFormatterPressure = MaskTextInputFormatter(
    mask: '###/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class Doctor extends StatefulWidget {
  final DoctorModel? doctor_info;
  const Doctor({super.key, this.doctor_info});

  @override
  State<Doctor> createState() => _Doctor();
}

class _Doctor extends State<Doctor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Страница врача"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Выйти"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                //Navigator.pop(context);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false);
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
                child: const Text("Личный кабинет"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/account_doctor');
                } //{
                //Navigator.push(
                //   context,
                //  MaterialPageRoute(
                //    builder: (context) => const DoctorPersonalAccount()));
                //},
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
              'Выберите пациента: ',
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
