import 'package:flutter/material.dart';

class InformationAboutOrganization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Сведения об организации")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Здесь будут сведения об организации',
            ),
          ],
        ),
      ),
    );
  }
}
