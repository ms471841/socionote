import 'package:flutter/material.dart';
import 'package:socionote/homepage.dart';

void main() {
  runApp(SocioNote());
}

class SocioNote extends StatefulWidget {
  SocioNote({Key key}) : super(key: key);

  @override
  _SocioNoteState createState() => _SocioNoteState();
}

class _SocioNoteState extends State<SocioNote> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocioNote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: SocioNoteHome(),
    );
  }
}
