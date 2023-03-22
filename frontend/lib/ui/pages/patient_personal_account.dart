import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/widgets/dropdown_button_gender.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskFormatterDate = new MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class PatientPersonalAcccount extends StatefulWidget {
  _PatientPersonalAccount createState() {
    return new _PatientPersonalAccount();
  }
}

bool _isShow = false;

class _PatientPersonalAccount extends State<PatientPersonalAcccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Личный кабинет")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                'Дата рождения ',
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
                'Пол ',
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
                'Рост ',
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
                'Вес ',
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
                'Мой рейтинг: ',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.teal, fontSize: 20),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              child: const Text("Поменять пароль"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(
                        "Отправить письмо на эл. почту с ссылкой на смену пароля?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Да'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Нет'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          new Container(
            child: OutlinedButton(
              child: new Text(
                _isShow ? 'Скрыть' : 'Изменить данные',
              ),
              onPressed: () {
                setState(
                  () {
                    _isShow = !_isShow;
                  },
                );
              },
            ),
            height: 50.0,
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Фамилия"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Имя"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Отчество"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [maskFormatterDate],
              decoration: new InputDecoration(labelText: "Дата рождения"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: Text(
              'Пол',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: DropdownButtonGender(),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Рост (cm)"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Вес"),
            ),
          ),
          SizedBox(height: 10),
          new Visibility(
            visible: _isShow,
            child: OutlinedButton(
              child: new Text("Сохранить изменения"),
              onPressed: () {
                null;
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
