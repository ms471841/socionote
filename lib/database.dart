import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  Future<void> saveUserNote(userNote, userName) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userName)
        .collection("notes")
        .add(userNote);
  }

  Future<void> addUser(userName) async {
    FirebaseFirestore.instance.collection("users").doc(userName);
  }

  Future getNotes(userName) async {
    print(userName);
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userName)
        .collection("notes")
        .orderBy('time', descending: false)
        .snapshots();
  }
}
