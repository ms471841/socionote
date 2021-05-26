import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socionote/database.dart';
import 'package:toast/toast.dart';

class ProfileUI extends StatefulWidget {
  final String userImage;
  final String userEmail;
  ProfileUI({Key key, @required this.userImage, @required this.userEmail})
      : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  DataBase dataBase = DataBase();
  final String constimage =
      "https://www.sorcererking.com/images/metarealm/avatarUnknown.jpg";

  TextEditingController suggestioneditingcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  submitFeedBack() async {
    if (formkey.currentState.validate()) {
      Toast.show("Thansk your feedback", context,
          duration: 3, gravity: Toast.TOP);

      Map<String, String> userSuggestion = {
        "suggestion": suggestioneditingcontroller.text,
      };
      await dataBase.addSuggestion(userSuggestion, widget.userEmail);
      setState(() {
        suggestioneditingcontroller.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Ink(
                  height: 250,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 6),
                            ),
                            child: Hero(
                              tag: 'image',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: (widget.userImage == null)
                                    ? Image.network(
                                        constimage,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        widget.userImage,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.userEmail.replaceAll("@gmail.com", ""),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      // Card(
                      //   elevation: 10,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      //   child: Container(
                      //     height: 80,
                      //     width: 300,
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: EdgeInsets.symmetric(
                      //             vertical: 20,
                      //             horizontal: 15,
                      //           ),
                      //         ),
                      //         Text("Total Friends",
                      //             style: TextStyle(fontSize: 20)),
                      //         SizedBox(
                      //           width: 50,
                      //         ),
                      //         Text(
                      //           "dont",
                      //           style:
                      //               TextStyle(fontSize: 20, color: Colors.cyan),
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text("😀")
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            "E-Mail",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                          subtitle: Text(widget.userEmail),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                        ListTile(
                          title: Text(
                            "Phone Number",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.phone_android,
                            color: Colors.cyan,
                          ),
                          subtitle: Text("Number not found"),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                        ListTile(
                          title: Text(
                            "About",
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Icon(
                            Icons.people,
                            color: Colors.cyan,
                          ),
                          subtitle: Text("You are "),
                          trailing: Icon(Icons.expand_less),
                          tileColor: Colors.cyan[50],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: formkey,
                          child: TextFormField(
                            validator: (val) {
                              return val.isNotEmpty
                                  ? null
                                  : "Please enter FeedBack";
                            },
                            controller: suggestioneditingcontroller,
                            maxLines: 5,
                            minLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                helperText: "Suggestion",
                                labelText: " feedback or Suggestion",
                                hintText: "Enter Suggestion"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: submitFeedBack,
                              child: Text("Submit"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text("Powered by Manish saini")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
