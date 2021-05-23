import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socionote/addNote.dart';
import 'package:socionote/database.dart';
import 'package:socionote/service.dart';
import 'package:socionote/sharedpre.dart';
import 'package:socionote/signup.dart';

class SocioNoteHome extends StatefulWidget {
  SocioNoteHome({Key key}) : super(key: key);

  @override
  _SocioNoteHomeState createState() => _SocioNoteHomeState();
}

class _SocioNoteHomeState extends State<SocioNoteHome> {
  Stream<QuerySnapshot> notestream;
  String image;

  Future<void> userSignOut() async {
    await Service().signout();
    Helper.saveUserloggedInSharedPreference(false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Signup()));
  }

  Future<void> getUserNote() async {
    String userName = await Helper.getUsernameSharedPreference();
    print(userName);
    await DataBase().getNotes(userName).then(
      (value) {
        setState(() {
          notestream = value;
        });
      },
    );
  }

  Widget noteList() {
    return StreamBuilder(
      stream: notestream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NoteTile(
                    title: snapshot.data.docs[index].data()["title"],
                  );
                },
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }

  getuserImage() async {
    image = await Helper.getUserImageSharedPreference();
  }

  @override
  void initState() {
    super.initState();
    getUserNote();
    getuserImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SocioNote"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.exit_to_app_rounded),
              onPressed: userSignOut,
            ),
          ),
        ],
        leading: Container(
          child: ClipRRect(
              //     child: image != null ? NetworkImage(image) : Icon(Icons.ac_unit),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: noteList(),
      ),
    );
  }
}

class NoteTile extends StatelessWidget {
  final String title;
  NoteTile({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
      ],
    );
  }
}
