import 'package:flutter/material.dart';

const List<String> listDoctors = <String>[];

class DropdownDoctors extends StatefulWidget {
  const DropdownDoctors({super.key});

  @override
  State<DropdownDoctors> createState() => _DropdownDoctors();
}

class _DropdownDoctors extends State<DropdownDoctors> {
  String dropdownValue = listDoctors.first;

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
      items: listDoctors.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
