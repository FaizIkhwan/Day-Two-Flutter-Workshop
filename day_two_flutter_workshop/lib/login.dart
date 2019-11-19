//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'homepage.dart';
import 'package:day_two_flutter_workshop/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final String url = "http://35.240.250.178/loginn.php";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[

              Text("Login"),

              // insert image
              Image.asset("assets/images/cat.jpeg"),

              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      controller: usernameController,
                      validator: (String text) {
                        if(text.isEmpty)
                          return "Username cannot be empty";
                      },
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                    ), // end TextFormField Username

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
                    ), // end TextFormField Password

                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        if(formKey.currentState.validate()) {
                          String username = usernameController.text;
                          String password = passwordController.text;

                          login(username, password);
                        }
                      },
                    ), // end RaisedButton

                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Register()),
                        );
                      },
                    ), // end RaisedButton

                  ],
                ),

              ), // end form

            ],
          ), // end column
        ),
      ),
    );
  }

  Future<void> login(String username, String password) async {
    final response = await http.post(url, body: {
      "username" : username,
      "password" : password,
    });

    var dataUser = json.decode(response.body);

    String responseUsername = dataUser[0]["username"];
    String responseFirstName = dataUser[0]["first_name"];
    String responseLastName = dataUser[0]["last_name"];

    String fullName = responseFirstName + " " + responseLastName;
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => HomePage(responseUsername, fullName)
    ));
  }

}
