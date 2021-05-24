import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:socionote/addNote.dart';
import 'package:socionote/database.dart';
import 'package:socionote/profileUI.dart';
import 'package:socionote/service.dart';
import 'package:socionote/sharedpre.dart';
import 'package:socionote/shownote.dart';
import 'package:socionote/signup.dart';

class SocioNoteHome extends StatefulWidget {
  SocioNoteHome({Key key}) : super(key: key);

  @override
  _SocioNoteHomeState createState() => _SocioNoteHomeState();
}

class _SocioNoteHomeState extends State<SocioNoteHome> {
  Stream<QuerySnapshot> notestream;
  String image, email;

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
                    description:
                        snapshot.data.docs[index].data()["Description"],
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
    email = await Helper.getUsernameSharedPreference();
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
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileUI(
                          userImage: image,
                          userEmail: email,
                        )));
          },
          child: Container(
            margin: EdgeInsets.only(left: 12, top: 6, bottom: 6),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Hero(
              tag: 'image',
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: image != null
                      ? Image.network(
                          image,
                          fit: BoxFit.fill,
                        )
                      : Icon(Icons.people)),
            ),
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
      body: noteList(),
    );
  }
}

class NoteTile extends StatelessWidget {
  final String title;
  final String description;
  NoteTile({Key key, @required this.title, @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            description,
            overflow: TextOverflow.ellipsis,
          ),
          enabled: true,
          tileColor: Colors.blueAccent,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ShowNote()));
          },
        ),
      ),
    );
  }
}
