import 'package:flutter/material.dart';
import 'dart:core';
import 'package:sampleapp/region_model.dart';
import 'package:sampleapp/repository.dart';
import 'package:sampleapp/pages/attractiondetails_page.dart';

class RegionListPage extends StatelessWidget {

  final RegionModel currentRegion = Repository.allRegions().firstWhere((r) => r.id == Repository.currentRegion);

  List<Widget> getAttractionsCardsFromRegion(context) {
    List<Widget> allCards = List<Widget>();

    for(var currentAttraction in currentRegion.attractions) {
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
        title: Text(currentRegion.region)
      ),
      body: ListView(
        children: getAttractionsCardsFromRegion(context),
      ),
    );
  }
}