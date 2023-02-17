import 'package:flutter/material.dart';

const List<String> listPatients = <String>[];

class DropdownPatients extends StatefulWidget {
  const DropdownPatients({super.key});

  @override
  State<DropdownPatients> createState() => _DropdownPatients();
}

class _DropdownPatients extends State<DropdownPatients> {
  String dropdownValue = listPatients.first;

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
      items: listPatients.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
