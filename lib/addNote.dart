import 'package:flutter/material.dart';
import 'package:socionote/database.dart';
import 'package:socionote/homepage.dart';
import 'package:socionote/sharedpre.dart';

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
    Map<String, String> userNote = {
      "title": titlecontroller.text,
      "Description": bodycontroller.text,
    };

    String email = await Helper.getUsernameSharedPreference();
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
            icon: Icon(Icons.save),
            onPressed: () {
              saveNote();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                enabledBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: bodycontroller,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: "Type something....",
                enabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
