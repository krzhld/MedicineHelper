import 'package:flutter/material.dart';
import 'package:MedicineHelper/ui/pages/chat.dart';

class ChoiceChatWithDoctor extends StatefulWidget {
  _ChoiceChatWithDoctor createState() {
    return new _ChoiceChatWithDoctor();
  }
}

class _ChoiceChatWithDoctor extends State<ChoiceChatWithDoctor> {
  final listDoctors = <String>['Вася ', 'Петя', 'Коля'];
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Выберите врача, которому хотели бы написать")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              itemCount: listDoctors.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () {
                      _selectedIndex = index;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                    selected: index == _selectedIndex,
                    selectedTileColor: Colors.black12,
                    title: Text(listDoctors[index],
                        style: TextStyle(color: Colors.teal, fontSize: 22)));
              })),
    );
  }
}
