import 'package:doctor_appointment/screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment/res/custom_colors.dart';
import 'package:doctor_appointment/screens/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  late List<Widget> _widgetOptions = <Widget>[
    // Center(
    //   child: Text('Home'),
    // ),
    HomePage(user: _user),
    Center(
      child: Text('Messages'),
    ),
    Center(
      child: Text('Shedule'),
    ),
    Test(),
  ];

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 25,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: CustomColors.primaryButton,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: CustomColors.primaryButton,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_rounded,
              color: CustomColors.primaryButton,
            ),
            title: Text(
              'Messages',
              style: TextStyle(
                color: CustomColors.primaryButton,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range,
              color: CustomColors.primaryButton,
            ),
            title: Text(
              'Schedule',
              style: TextStyle(
                color: CustomColors.primaryButton,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: CustomColors.primaryButton,
            ),
            title: Text(
              'Setting',
              style: TextStyle(
                color: CustomColors.primaryButton,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _user;
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              // height: 50,
              margin: EdgeInsets.only(left: 20, right: 10, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        _user.displayName! + "👋",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  _user.photoURL != null
                      ? Container(
                          height: 45,
                          child: ClipOval(
                            child: Material(
                              // color: CustomColors.firebaseGrey.withOpacity(0.3),
                              child: Image.network(
                                _user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 45,
                          child: ClipOval(
                            child: Material(
                              color: CustomColors.firebaseGrey.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: CustomColors.firebaseGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
