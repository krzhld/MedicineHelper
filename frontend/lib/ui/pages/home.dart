import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/authorization.dart';
import 'package:MedicineHelper/ui/pages/contacts.dart';
import 'package:MedicineHelper/ui/pages/express_test.dart';
import 'package:MedicineHelper/ui/pages/list_of_doctors_in_organization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Медицинский помощник")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Здесь будут сведения о сервисе и его доступных услугах',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Войти"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Authorization()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Контакты"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Contacts()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Экспресс-тест"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExpressTest()));
                  },
                )),
            SizedBox(
                width: 400.0,
                height: 50.0,
                child: OutlinedButton(
                  child: const Text("Наши специалисты"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListOfDoctors()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
