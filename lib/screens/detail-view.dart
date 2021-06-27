import 'package:doctor_appointment/database/database.dart';
import 'package:doctor_appointment/res/custom_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailedView extends StatefulWidget {
  DetailedView({Key? key, required this.doctor, required this.db})
      : super(key: key);

  Map doctor;
  Database db;

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text(widget.doctor['name']),
      // ),
      // appBar: AppBar(
      //   backgroundColor: CustomColors.primaryButton,
      //   elevation: 0,
      //   title: Text(widget.doctor['name']),
      // ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(
          top: 60,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: widget.doctor['image'] == null
                          ? NetworkImage(
                              "https://img-premium.flaticon.com/png/512/4140/premium/4140048.png?token=exp=1624628056~hmac=fd7cb1dfedbb69a7202821cd765729a3")
                          : NetworkImage(widget.doctor['image']),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      widget.doctor['name'],
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.doctor['type'],
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: Icon(
                      Icons.call_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon: Icon(
                      Icons.email_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
