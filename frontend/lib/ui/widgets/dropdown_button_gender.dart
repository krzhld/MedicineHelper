import 'package:flutter/material.dart';

const List<String> list = <String>[' ', 'Женский', 'Мужской'];

class DropdownButtonGender extends StatefulWidget {
  const DropdownButtonGender({super.key});

  @override
  State<DropdownButtonGender> createState() => _DropdownButtonGender();
}

class _DropdownButtonGender extends State<DropdownButtonGender> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.teal),
      underline: Container(
        height: 2,
        color: Colors.teal,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
