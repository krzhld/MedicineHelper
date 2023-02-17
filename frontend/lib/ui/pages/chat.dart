import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  _Chat createState() {
    return new _Chat();
  }
}

class MessageData {
  //message data model
  String msgtext, userid;
  bool isme;
  MessageData(
      {required this.msgtext, required this.userid, required this.isme});
}

class _Chat extends State<Chat> {
  List<MessageData> msglist = [];
  TextEditingController msgtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text("''")),
        // leading: Icon(Icons.circle,
        //         color: connected ? Colors.greenAccent : Colors.redAccent),
        //if app is connected to node.js then it will be gree, else red.
        //  titleSpacing: 0,
        body: Container(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 70,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                            child: Column(
                          children: msglist.map((onemsg) {
                            return Container(
                                margin: EdgeInsets.only(
                                  //if is my message, then it has margin 40 at left
                                  left: onemsg.isme ? 40 : 0,
                                  right: onemsg.isme
                                      ? 0
                                      : 40, //else margin at right
                                ),
                                child: Card(
                                    color: onemsg.isme
                                        ? Colors.teal[100]
                                        : Colors.white,
                                    //if its my message then, blue background else red background
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(onemsg.isme
                                                  ? "ID: ME"
                                                  : "ID: " + onemsg.userid)),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                                "Message: " + onemsg.msgtext,
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ],
                                      ),
                                    )));
                          }).toList(),
                        ))
                      ],
                    )))),
            Positioned(
              //position text field at bottom of screen

              bottom: 0, left: 0, right: 0,
              child: Container(
                  color: Colors.black12,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: msgtext,
                          decoration:
                              InputDecoration(hintText: "Введите сообщение"),
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Icon(Icons.send),
                            onPressed: () {
                              if (msgtext.text != "") {
                                /*  sendmsg(msgtext.text,
                                    recieverid); */ //send message with webspcket
                              } else {
                                print("Введите сообщение");
                              }
                            },
                          ))
                    ],
                  )),
            )
          ],
        )));
  }
}
