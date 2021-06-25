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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 5,
          child: GridView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: docs.length,
            itemBuilder: (BuildContext context, int index) {
              // ignore: unnecessary_null_comparison

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      spreadRadius: 5.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: docs[index]['image'] == null
                          ? NetworkImage(
                              "https://img-premium.flaticon.com/png/512/4140/premium/4140048.png?token=exp=1624628056~hmac=fd7cb1dfedbb69a7202821cd765729a3")
                          : NetworkImage(docs[index]['image']),
                      radius: 40,
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      docs[index]['name'],
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      docs[index]['type'],
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "⭐ ${docs[index]['rating']}",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
