//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:day_two_flutter_workshop/homepage.dart';

class EditProfile extends StatefulWidget {

  final String username;

  EditProfile(this.username);

  @override
  _EditProfileState createState() => _EditProfileState(this.username);
}

class _EditProfileState extends State<EditProfile> {

  final String username;

  _EditProfileState(this.username);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile"),),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[

                TextFormField(
                  controller: firstNameController,
                  validator: (String text) {
                    if(text.isEmpty)
                      return "First name cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "First name",
                  ),
                ),

                TextFormField(
                  controller: lastNameController,
                  validator: (String text) {
                    if(text.isEmpty)
                      return "Last name cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "Last name",
                  ),
                ),

                TextFormField(
                  controller: passwordController,
                  obscureText: true, // password
                  validator: (String text) {
                    if(text.isEmpty)
                      return "Password cannot be empty";
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),

                RaisedButton(
                  child: Text("Update"),
                  onPressed: () {
                    if(formKey.currentState.validate()) {
                      debugPrint("UPDATE");
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String password = passwordController.text;

                      // TODO: UPDATE INFO
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
