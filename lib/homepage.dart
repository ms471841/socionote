import 'package:flutter/material.dart';
import 'package:socionote/addNote.dart';

class SocioNoteHome extends StatefulWidget {
  SocioNoteHome({Key key}) : super(key: key);

  @override
  _SocioNoteHomeState createState() => _SocioNoteHomeState();
}

class _SocioNoteHomeState extends State<SocioNoteHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SocioNote"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add New Note",
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
