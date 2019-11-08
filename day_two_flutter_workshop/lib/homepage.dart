//
//  Created by Faiz Ikhwan on 4 August 2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:day_two_flutter_workshop/edit_profile.dart';
import 'package:day_two_flutter_workshop/login.dart';

class HomePage extends StatefulWidget {

  final String realname;
  final String username;

  HomePage(this.username, this.realname);

  @override
  _HomePageState createState() => _HomePageState(this.username, this.realname);

}

class _HomePageState extends State<HomePage> {

  final String realname;
  final String username;

  String status = "Offline";

  _HomePageState(this.username, this.realname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text("Welcome"),

              Text(realname),

              Text(status),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  RaisedButton(
                    child: Text("Online"),
                    onPressed: () {
                      setState(() {
                        status = "Online";
                      });
                    },
                  ),

                  RaisedButton(
                    child: Text("Offline"),
                    onPressed: () {
                      setState(() {
                        status = "Offline";
                      });
                    },
                  ),

                ],
              ),

              RaisedButton(
                child: Text("Edit profile information"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditProfile(username)),
                  );
                },
              ),

              RaisedButton(
                child: Text("Delete account"),
                onPressed: () {
                  // TODO: Delete account
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

}
