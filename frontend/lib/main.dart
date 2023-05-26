import 'package:MedicineHelper/ui/pages/doctor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MedicineHelper/firebase_options.dart';
import 'package:MedicineHelper/ui/pages/registration_patient.dart';
import 'package:MedicineHelper/ui/pages/home.dart';
import 'package:MedicineHelper/ui/pages/authorization.dart';
import 'package:MedicineHelper/ui/pages/doctor_personal_account.dart';
import 'package:MedicineHelper/ui/pages/patient_personal_account.dart';
import 'package:MedicineHelper/ui/pages/registration_doctor.dart';
import 'package:MedicineHelper/services/firebase_stream.dart';
import 'package:MedicineHelper/ui/pages/reset_password.dart';
import 'package:MedicineHelper/ui/pages/verify_email_screen.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(const MedicineHelper());
}

class MedicineHelper extends StatelessWidget {
  const MedicineHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Медицинский помощник',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal[50],
        primarySwatch: Colors.teal,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0))),
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomePage(),
        '/registration_doctor': (context) => const RegistrationDoctor(),
        '/registration_patient': (context) => const RegistrationPatient(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const Doctor(),
        '/login': (context) => const Authorization(),
        '/account_doctor': (context) => const DoctorPersonalAccount(),
        '/account_patient': (context) => const PatientPersonalAcccount(),
      },
      initialRoute: '/',
    );
  }
}
