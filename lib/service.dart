import 'package:firebase_auth/firebase_auth.dart';

class Service {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future signout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      return e.toString();
    }
  }
}
