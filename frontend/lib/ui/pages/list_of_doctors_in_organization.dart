import 'package:flutter/material.dart';

class Doctor {
  //временный класс, потом будет формироваться из json'a!!!!!
  String name;
  String spezialize;
  double rating;
  Doctor(this.name, this.spezialize, this.rating);
}

final List<Doctor> doctors = <Doctor>[
  Doctor("Иванов Иван Иванович", "Окулист", 4.75),
  Doctor("Петрова Екатерина Иванова", "Терапевт", 4.2)
];

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Список врачей орагнизации")),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: doctors.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctors[index].name,
                        style: TextStyle(fontSize: 24, color: Colors.teal)),
                    Text(
                        "Специализация: ${doctors[index].spezialize}, Средняя оценка: ${doctors[index].rating}",
                        style: TextStyle(fontSize: 22)),
                    const SizedBox(height: 10),
                  ],
                ));
          }),
    );
  }
}
