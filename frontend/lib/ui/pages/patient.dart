import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/patient_personal_account.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:MedicineHelper/ui/pages/choice_a_chat_with_a_doctor.dart';
import 'package:flutter/services.dart';

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
bool _availableActions = false;
bool _isShowDataInTime = false;
bool _appointment = false;

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _Patient();
}

class _Patient extends State<Patient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Страница пациента"),
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
              child: Text(
                _availableActions ? 'Скрыть' : 'Доступные действия',
              ),
              onPressed: () {
                setState(
                  () {
                    _availableActions = !_availableActions;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _availableActions,
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
            visible: _isShowHealthData && _availableActions,
            child: TextField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [maskFormatterDate],
              decoration: const InputDecoration(labelText: "Дата"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData && _availableActions,
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Пульс"),
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowHealthData && _availableActions,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatterPressure],
              decoration: const InputDecoration(labelText: "Давление"),
            ),
          ),
          Visibility(
            visible: _isShowHealthData && _availableActions,
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Сатурация"),
            ),
          ),
          Visibility(
            visible: _isShowHealthData && _availableActions,
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
            visible: _isShowHealthData && _availableActions,
            child: OutlinedButton(
              child: const Text("Сохранить"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: const Text("Построение графиков"),
              onPressed: () {
                setState(
                  () {
                    _isShowDataInTime = !_isShowDataInTime;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isShowDataInTime && _availableActions,
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterDate],
                  decoration: const InputDecoration(labelText: "С"),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatterDate],
                  decoration: const InputDecoration(labelText: "По"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: Text(
                _isShowDropdownDoctors ? 'Скрыть' : 'Запись ко врачу',
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
            visible: _isShowDropdownDoctors && _availableActions,
            child: Text(
              'Выберите врача: ',
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
            visible: _isShowDropdownDoctors && _availableActions,
            child: OutlinedButton(
              child: const Text("Записаться"),
              onPressed: () {
                null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: const Text("Мессенджер"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChoiceChatWithDoctor()));
              },
            ),
          ),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: const Text("Промотр своих приемов у врачей"),
              onPressed: () {
                null;
              },
            ),
          ),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: const Text("Просмотр полученных рекомендаций"),
              onPressed: () {
                null;
              },
            ),
          ),
          Visibility(
            visible: _availableActions,
            child: OutlinedButton(
              child: const Text("Оценивание врачей"),
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
