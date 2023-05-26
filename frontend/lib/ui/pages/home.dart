import 'package:MedicineHelper/ui/pages/patient.dart';
import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/authorization.dart';
import 'package:MedicineHelper/ui/pages/contacts.dart';
import 'package:MedicineHelper/ui/pages/express_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MedicineHelper/ui/pages/doctor_personal_account.dart';
import 'package:MedicineHelper/ui/pages/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MedicineHelper/models/user.dart';
import 'dart:developer';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Домашняя страница")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              """
                                      Приложение для взаимодействия врачей с пациентами. 
                          Его цели: упростить и автоматизировать коммуникацию между врачами и пациентами,
                          предоставить дополнительные инструменты для контроля состояния пациентов""",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Войти"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Authorization()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Контакты"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Contacts()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Экспресс-тест"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExpressTest()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Наши специалисты"),
                  onPressed: null, //() {
                  //Navigator.push(
                  //  context,
                  //MaterialPageRoute(
                  //  builder: (context) => const ListOfDoctors()));
                  //},
                )),
          ],
        ),
      ),
    );
  }
}
