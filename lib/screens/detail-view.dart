import 'package:doctor_appointment/database/database.dart';
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
      body: Center(
        child: Text(widget.doctor['name']),
      ),
    );
  }
}
