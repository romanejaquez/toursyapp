import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sampleapp/pages/mainlist_page.dart';
import 'package:sampleapp/repository.dart';
import 'dart:async';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Repository.context = context;
    Timer.run(() {
      new Timer(new Duration(days: 0, hours: 0, minutes: 0, seconds: 2, microseconds: 0, milliseconds: 0), () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainListScreenStateful(context))
            );
      });
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/toursy_logo.png', width: 200.0, height: 150.0, fit: BoxFit.contain),
            new CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 255, 255)),
                strokeWidth: 5.0
                )
          ],
        ),
      ),
    );
  }
}
