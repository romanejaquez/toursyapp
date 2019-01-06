import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/repository.dart';
import 'package:sampleapp/attraction_model.dart';

class AttractionDetails extends StatelessWidget {

  final AttractionModel currentAttraction = Repository.getCurrentAttraction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Image.asset('assets/translation_icon.png'),
        ),
        onPressed: () {
          Repository.textToSpeech(textToSpeech: currentAttraction.name);
        },
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
        title: Text(currentAttraction.name)
      ),
      body: SingleChildScrollView(
        child: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "mainHero",
              child: Image.network(currentAttraction.img),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Padding(
                  child: FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    heroTag: 'fav',
                    child: Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0)
                ),
                Padding(
                  child: FloatingActionButton(
                    backgroundColor: Colors.deepOrange,
                    heroTag: 'star',
                    child: Icon(Icons.star_border, color: Colors.white),
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0)
                ),
                Padding(
                  child: FloatingActionButton(
                    heroTag: 'share',
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.share, color: Colors.white),
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0)
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              )
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      currentAttraction.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                      ),
                ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(currentAttraction.province,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Color.fromRGBO(140, 140, 140, 1.0)
                      ),
                    ),
                  ),
                  Padding(child: Text(
                    currentAttraction.description,
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                    textAlign: TextAlign.left
                  ), padding: EdgeInsets.only(bottom: 20.0),),
                  RaisedButton(
                    color: Color.fromRGBO(31, 152, 255, 1.0),
                    child: Row(children: <Widget>[
                      Image.asset('assets/video_icon.png',
                      width: 20.0, height: 20.0),
                      Padding(child: Text('Watch Video', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                      ),), padding: EdgeInsets.only(left: 20.0),),
                      
                    ],),
                    onPressed: () {

                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}

