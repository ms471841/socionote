import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:socionote/database.dart';
import 'package:socionote/sharedpre.dart';

class ShowNote extends StatefulWidget {
  final String title, note;
  ShowNote({Key key, @required this.title, @required this.note})
      : super(key: key);

  @override
  _ShowNoteState createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  deleteNote() async {
    String userName = await Helper.getUsernameSharedPreference();
    int userId = await Helper.getUserNoteIdSharedPreference();
    DataBase()
        .deleteNote(userName, widget.title, userId)
        .whenComplete(() => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SocioNote"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                tileColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                title: Text(
                  widget.title.titleCase,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    border: Border.all(width: 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.note.sentenceCase),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     deleteNote();
      //   },
      // ),
    );
  }
}
