import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var messages = List();
  Random rd = Random();
  TextEditingController _ctrlMess = TextEditingController();
  ScrollController _scroll = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages.addAll([
      "Hello",
      "Hi",
      "Cháu chào bác ạ.",
      "Cháu cháu.",
      "Morning",
      "Chào các bạn, tiếp tục với việc nghiên cứu Flutter",
      "message list",
      "Chào các bạn, tiếp tục với việc nghiên cứu Flutter bla bla bla bla"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Message Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Message Layout"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scroll,
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, id) {
                  if (rd.nextInt(2) == 1) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 3, bottom: 3, right: 31, left: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(messages[id]),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 3, bottom: 3, right: 5, left: 31),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            messages[id],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.3, color: Colors.grey[300]))),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.insert_emoticon,
                        color: Colors.green,
                      ),
                      onPressed: () {}),
                  Flexible(
                    child: TextField(
                      onTap: (){
                        _scroll.jumpTo(_scroll.position.maxScrollExtent);
                      },
                      controller: _ctrlMess,
                      decoration: InputDecoration(
                          hintText: "Nhắn gì chẳng được ^^"),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        messages.add(_ctrlMess.text);
                        _ctrlMess.text = "";
                        _scroll.jumpTo(_scroll.position.maxScrollExtent+50);
                        setState(() {});
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
