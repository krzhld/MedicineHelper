import 'package:flutter/material.dart';

class DoctorPersonalAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Личный кабинет")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(400, 10, 400, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Фамилия ',
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
                'Имя ',
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
                'Отчество ',
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
                'Специализация ',
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
