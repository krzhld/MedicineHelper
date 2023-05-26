import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/widgets/dropdown_button_gender.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/services.dart';

var maskFormatterPressure = MaskTextInputFormatter(
    mask: '###/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class ExpressTest extends StatefulWidget {
  const ExpressTest({super.key});

  @override
  State<ExpressTest> createState() => _ExpressTest();
}

class _ExpressTest extends State<ExpressTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Экспресс-тест')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            width: 400.0,
            child: Text(
              'Введите свои параметры:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: Text(
              'Пол:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: DropdownButtonGender(),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  helperText: 'Вводите только цифры',
                  labelText: 'Возраст',
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  helperText: 'Вводите только цифры',
                  labelText: 'Рост',
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  helperText: 'Вводите только цифры',
                  labelText: 'Вес',
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            width: 400.0,
            child: Text(
              'Проверить свои данные в текущий момент:',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
          ),
          SizedBox(
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(labelText: "Пульс"),
            ),
          ),
          SizedBox(
              width: 400.0,
              height: 50.0,
              child: OutlinedButton(
                child: const Text('Проверить пульс'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text("Ваш пульс в норме"),
                    ),
                  );
                },
              )),
          SizedBox(
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(labelText: "Верхнее давление"),
            ),
          ),
          SizedBox(
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(labelText: "Нижнее давление"),
            ),
          ),
          SizedBox(
              width: 400.0,
              height: 50.0,
              child: OutlinedButton(
                child: const Text('Проверить давление'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text("Ваше давление в норме"),
                    ),
                  );
                },
              )),
          SizedBox(
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(labelText: "Сатурация"),
            ),
          ),
          SizedBox(
              width: 400.0,
              height: 50.0,
              child: OutlinedButton(
                child: const Text('Проверить сатурацию'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text("Ваша сатурация в норме"),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
