import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/activity_model.dart';
import 'package:sampleapp/repository.dart';
import 'package:sampleapp/pages/attractiondetails_page.dart';
import 'package:sampleapp/attraction_model.dart';

class ActivityAttractionsListPage extends StatelessWidget {

  ActivityModel currentActivity;
  List<AttractionModel> allAttractions;
  
  ActivityAttractionsListPage() {
     currentActivity = Repository.allActivities().firstWhere((a) => a.id == Repository.currentActivity);
  }
  
  List<Widget> getAttractionsCardsFromActivity(context) {
    List<Widget> allCards = List<Widget>();

    for(var currentAttraction in currentActivity.attractions) {
      allCards.add(Repository.getCard(
        context: context,
        topLabel: currentAttraction.name,
        bottomLabel: currentAttraction.province,
        imgPath: currentAttraction.img,
        onTap: () {
          Repository.currentAttraction = currentAttraction.id;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttractionDetails())
          );
        }
      ));
    }

    return allCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
        title: Text(currentActivity.name)
      ),
      body: ListView(
        children: getAttractionsCardsFromActivity(context),
      ),
    );
  }
}