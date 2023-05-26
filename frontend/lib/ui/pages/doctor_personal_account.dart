import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/doctor.dart';
import 'package:MedicineHelper/models/doctor.dart';

class DoctorPersonalAccount extends StatefulWidget {
  const DoctorPersonalAccount({super.key});

  @override
  State<DoctorPersonalAccount> createState() => _DoctorPersonalAccount();
}

class _DoctorPersonalAccount extends State<DoctorPersonalAccount> {
  var doctor_snapshot;

  Future<void> fetchDoctors() async {
    final user = FirebaseAuth.instance.currentUser;
    final doctors_ref = FirebaseFirestore.instance.collection('doctors');

    final query = doctors_ref.where('email', isEqualTo: user?.email);
    query.get().then((querySnapshot) {
      doctor_snapshot = querySnapshot.docs[0].data();
    });
  }

  @override
  void initState() {
    fetchDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(doctor_snapshot.toString());
    return Scaffold(
      appBar: new AppBar(title: new Text("Личный кабинет")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(400, 10, 400, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Фамилия: Иванов',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                'Имя: Иван',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                'Отчество Иванович',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                'Специализация хирург',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                'Мой рейтинг: 5',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}
