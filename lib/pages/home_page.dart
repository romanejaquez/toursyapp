import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/pages/mainlist_page.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/homebg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/toursy_logo.png',scale: 1.5,),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/badge_icon.png'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainListScreen())
                      );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/dr_map_white.png'),
                  ),
                  onPressed: () {

                  },
                )
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/activity_icon.png'),
                  ),
                  onPressed: () {

                  },
                )
              )
            ],
          ),
    );
  }
}
