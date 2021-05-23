import 'dart:async';
import 'package:flutter/material.dart';
import 'package:socionote/homepage.dart';
import 'package:socionote/sharedpre.dart';
import 'package:socionote/signup.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool islogin;
  Future getLoggedInState() async {
    await Helper.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        islogin = value;
      });
    });
  }

  @override
  void initState() {
    getLoggedInState();
    super.initState();
    Timer(
      Duration(milliseconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => islogin != null
                  ? islogin
                      ? SocioNoteHome()
                      : Signup()
                  : Signup())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SocioNote",
                    style: TextStyle(fontSize: 30, fontFamily: "cursive"),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
