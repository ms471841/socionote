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
        centerTitle: true,
        title: Text("SocioHood"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
