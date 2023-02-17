import 'package:flutter/material.dart';
import 'package:medicine_helper/ui/pages/home.dart';

void main() => runApp(const MedicineHelper());

class MedicineHelper extends StatefulWidget {
  const MedicineHelper({super.key});

  @override
  State<MedicineHelper> createState() => _MedicineHelperState();
}

class _MedicineHelperState extends State<MedicineHelper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Медицинский помощник',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal[50],
        primarySwatch: Colors.teal,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0))),
      ),
      home: const HomePage(),
    );
  }
}
