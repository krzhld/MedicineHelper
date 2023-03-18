import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MedicineHelper/ui/pages/chat.dart';

class InteractionWithPatient extends StatefulWidget {
  const InteractionWithPatient({super.key});

  @override
  State<InteractionWithPatient> createState() => _InteractionWithPatient();
}

bool _isShowHealthData = false;
bool _isShowHealthDataInTime = false;

class _InteractionWithPatient extends State<InteractionWithPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Взаимодействие с пациентом")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: Text(
                _isShowHealthDataInTime ? 'Скрыть' : 'Просмотр данных пациента',
              ),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: const Text(
              'За какой период вывести данные:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthDataInTime,
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(labelText: "С"),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(labelText: "По"),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isShowHealthData,
            child: OutlinedButton(
              child: const Text("Посмотреть данные"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: OutlinedButton(
              child: const Text("Построить графики"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData,
            child: OutlinedButton(
              child: const Text("Скачать данные в формате csv"),
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
            child: const Text(
              'Верхнее давление:',
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration:
                      const InputDecoration(labelText: "Минимальное значение"),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
              'Нижнее давление:',
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration:
                      const InputDecoration(labelText: "Минимальное значение"),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration:
                      InputDecoration(labelText: "Минимальное значение"),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration:
                      InputDecoration(labelText: "Минимальное значение"),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
              child: const Text("Просмотр приемов"),
              onPressed: () {
                null;
              },
            ),
          ),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Запись на прием"),
              onPressed: () {
                null;
              },
            ),
          ),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Выданные рекомендации"),
              onPressed: () {
                null;
              },
            ),
          ),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Чат с пациентом"),
              onPressed: () {
                null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
