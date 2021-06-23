import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lottie/lottie.dart';
import 'package:doctor_appointment/res/custom_colors.dart';
import 'package:doctor_appointment/screens/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Lottie.asset(
                  "assets/doctor-and-patient-conversation.json",
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Welcome to the team!",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We are thrilled to have you at our office. You’re going to be a valuable asset to our company, and we can’t wait to see all that you accomplish! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                color: CustomColors.primaryButton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Get Start",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
