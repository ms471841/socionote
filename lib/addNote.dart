import 'package:flutter/material.dart';
import 'package:socionote/database.dart';
import 'package:socionote/homepage.dart';
import 'package:socionote/sharedpre.dart';
import 'package:socionote/userName.dart';

class AddNote extends StatefulWidget {
  AddNote({Key key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController bodycontroller = TextEditingController();

  Future<void> saveNote() async {
    Map<String, dynamic> userNote = {
      "title": titlecontroller.text,
      "Description": bodycontroller.text,
      "time": dateTime.millisecondsSinceEpoch,
    };
    String email = await Helper.getUsernameSharedPreference();
    // int userId = await Helper.getUserNoteIdSharedPreference();

    //await Helper.saveUserNoteIdSharedPreference(userId++);
    await DataBase().saveUserNote(userNote, email);
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => SocioNoteHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SocioNote",
        ),
        actions: [
          IconButton(
            tooltip: "save note",
            icon: Icon(Icons.save),
            onPressed: () {
              saveNote();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeOfDay.format(context),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: titlecontroller,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                      labelText: "Title"),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: bodycontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: "Type something....",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
