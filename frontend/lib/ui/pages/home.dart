import 'package:flutter/material.dart';
import 'package:medicine_helper/ui/pages/authorization.dart';
import 'package:medicine_helper/ui/pages/contacts.dart';

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
          ],
        ),
      ),
    );
  }
}
