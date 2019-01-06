import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/repository.dart';
import 'package:sampleapp/pages/attractiondetails_page.dart';
import 'package:sampleapp/pages/regionlist_page.dart';
import 'package:sampleapp/pages/activityattractions_page.dart';
import 'package:sampleapp/carousel_slider.dart';
import 'package:sampleapp/attraction_model.dart';
import 'package:sampleapp/activity_model.dart';

class MainListScreenStateful extends StatefulWidget {
  
  int currentPage = 0;
  bool isCarouselVisible = false;
  BuildContext c;

  MainListScreenStateful(BuildContext context) {
    c = context;
  }
 
  @override
  MainListScreen createState() {
    return MainListScreen(c);
  }

}

class MainListScreen extends State<MainListScreenStateful> {

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityAttractionsListPage())
          );
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegionListPage())
          );
        }
      ));
    }

    return allCards;
  }

  Widget getAllAttractionsCarousel(BuildContext context) {

    List<AttractionModel> attractions = Repository.topAttractions();

    CarouselSlider instance = CarouselSlider(
    height: 500,
    updateCallback: (int page) {
      setState(() {
        widget.currentPage = page;
      });
    },
    items: attractions.map((attraction) {
      return Repository.getCarouselCard(
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
      );
    }).toList(),
    viewportFraction: 0.7,
    aspectRatio: 2.0,
    autoPlay: false,
  );
    
    return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: instance
            )
          ],
    );
  }

  Widget getAllActivitiesCarousel(BuildContext context) {

    List<ActivityModel> activities = Repository.allActivities();

    CarouselSlider instance = CarouselSlider(
    height: 500,
    items: activities.map((activity) {
      return Repository.getCarouselCard(
        context: context,
        topLabel: activity.name,
        bottomLabel: activity.attractions.length.toString() + " attractions",
        imgPath: activity.img,
        onTap: () {
          Repository.currentActivity = activity.id;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityAttractionsListPage())
          );
        }
      );
    }).toList(),
    viewportFraction: 0.7,
    aspectRatio: 2.0,
    autoPlay: false,
  );
    
    return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: instance
            )
          ],
    );
  }

  Widget attractionsContainer;
  Widget regionsContainer;
  Widget activitiesContainer;

  void setContainerBasedOnView(BuildContext context) {
    widget.isCarouselVisible = !widget.isCarouselVisible;

    if (widget.isCarouselVisible) {
      attractionsContainer = getAllAttractionsCarousel(context);
      activitiesContainer = getAllActivitiesCarousel(context);
      regionsContainer = getAllActivitiesCarousel(context);
    }
    else {
      attractionsContainer = ListView(children: getAllAttractions(context));
      regionsContainer = ListView(children: getAllRegions(context));
      activitiesContainer = ListView(children: getAllActivities(context));
    }
  }

  MainListScreen(BuildContext context) {
    attractionsContainer = ListView(children: getAllAttractions(context));
    regionsContainer = ListView(children: getAllRegions(context));
    activitiesContainer = ListView(children: getAllActivities(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(!widget.isCarouselVisible ? Icons.view_carousel : Icons.view_headline)
          ),
          onPressed: () {
            setState(() {
                setContainerBasedOnView(context);
            });
          },
        ),
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
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            attractionsContainer,
            regionsContainer,
            activitiesContainer
          ],
        )
      )
      )
    );
  }
}
