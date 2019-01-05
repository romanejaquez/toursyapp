import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/repository.dart';
import 'package:sampleapp/pages/attractiondetails_page.dart';

class MainListScreen extends StatelessWidget {
  
  List<Widget> getAllAttractions(BuildContext context) {
    List<Widget> allCards = List<Widget>();

    for(var attraction in Repository.topAttractions())
    {
      allCards.add(Repository.getCard(
        context: context,
        topLabel: attraction.name,
        bottomLabel: attraction.province,
        imgPath: attraction.img,
        onTap: () {
              Repository.currentAttraction = attraction.id;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttractionDetails())
              );
        }
      )
      );
    }

    return allCards;
  }
    
  List<Widget> getAllActivities(BuildContext context) {
    List<Widget> allCards = List<Widget>();

    for(var activity in Repository.allActivities())
    {
      allCards.add(Repository.getCard(
        context: context,
        topLabel: activity.name,
        bottomLabel: activity.attractions.length.toString() + ' attractions',
        imgPath: activity.img,
        onTap: () {
          Repository.currentActivity = activity.id;
        }
      ));
    }

    return allCards;
  }
  
  List<Widget> getAllRegions(BuildContext context) {
    List<Widget> allCards = List<Widget>();

    for(var region in Repository.allRegions())
    {
      allCards.add(Repository.getCard(
        context: context,
        topLabel: region.region,
        bottomLabel: region.attractions.length.toString() + ' attractions',
        imgPath: region.img,
        onTap: () {
          Repository.currentRegion = region.id;
        }
      ));
    }

    return allCards;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Image.asset("assets/toursy_logo.png",
            width: 100.0),),
          backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Top Rated",
              icon: Image.asset('assets/badge_icon.png',
              height: 22.0, width: 22.0,)),
              Tab(text: "By Region", 
              icon: Image.asset('assets/dr_map_white.png',
              height: 22.0, width: 22.0)),
              Tab(text: "By Activity", 
              icon:Image.asset('assets/activity_icon.png',
              height: 22.0, width: 22.0)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: getAllAttractions(context)
            ),
            ListView(
              children: getAllRegions(context),
            ),
            ListView(
              children: getAllActivities(context),
            )
          ],
        )
      )
      )
    );
  }
}
