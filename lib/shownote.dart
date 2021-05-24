import 'package:flutter/material.dart';

class ShowNote extends StatefulWidget {
  ShowNote({Key key}) : super(key: key);

  @override
  _ShowNoteState createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SocioNote"),
      ),
    );
  }
}
