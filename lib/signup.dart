import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socionote/database.dart';
import 'package:socionote/homepage.dart';
import 'package:socionote/sharedpre.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool userLoggedIn = false;
  Future<void> signup() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential result = await auth.signInWithCredential(authCredential);
    User user = result.user;

    if (result != null) {
      setState(() {
        userLoggedIn = true;
      });
      String email = user.email;
      Helper.saveUserloggedInSharedPreference(userLoggedIn);
      Helper.saveUsernameSharedPreference(email);
      Helper.saveUserImageSharedPreference(user.photoURL);
      await DataBase().addUser(email);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SocioNoteHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "socioNote",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                color: Colors.teal[100],
                elevation: 10,
                child: Text("Google Sign up"),
                onPressed: () {
                  signup();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
