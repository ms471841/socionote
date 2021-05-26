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
    super.initState();
    getLoggedInState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => islogin != null
                ? islogin
                    ? SocioNoteHome()
                    : Signup()
                : Signup()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.blueAccent])),
        child: Padding(
          padding: const EdgeInsets.only(top: 220),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/notepad.png",
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "SocioNote",
                    style: TextStyle(
                        fontSize: 45,
                        fontFamily: "cursive",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Life is too fast don't forget anything ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "just Note it!",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CircularProgressIndicator(),
                  SizedBox(height: 100),
                  Text("By"),
                  Text("Your Developer"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
