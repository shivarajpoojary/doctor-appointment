import 'package:doctor_appointment/database/database.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: docs.length,
            itemBuilder: (BuildContext context, int index) {
              // ignore: unnecessary_null_comparison

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 30, left: 36),
                  title: Text(docs[index]['name']),
                  trailing: Text(docs[index]['type']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
