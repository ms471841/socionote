import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  Future<void> saveUserNote(userNote, userName) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userName)
        .collection("notes")
        .add(userNote);
    print("done");
  }

  Future<void> addUser(userName) async {
    FirebaseFirestore.instance.collection("users").doc(userName);
  }

  Future getNotes(userName) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userName)
        .collection("notes")
        .orderBy('time')
        .snapshots();
  }
}
