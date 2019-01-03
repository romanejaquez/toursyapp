import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:core';

void main() => runApp(MaterialApp(home: SplashPage()));

class Repository {
  static List<AttractionModel> allAttractions() {
    List<AttractionModel> allModels = List<AttractionModel>();

    allModels.addAll([
      AttractionModel(
        "r1a3",
        "Carnaval Bonao",
        "Bonao",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-bonao.jpg",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_bonao.mp4",
        "Each February, in celebration of Carnival, Bonao features its own unique characters parading to the beat of the carnival drums on Sundays. Bonao carnival characters include the Santos de Palo, wooden representations of Catholic saints made by the artists who are grouped according to the saints they have created. "
      ),
      AttractionModel(
        "r1a5",
        "Pico Duarte",
        "La Vega",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/pico-duarte.jpg",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/pico_duarte.mp4",
        "Pico Duarte is the highest peak in the Dominican Republic, and all the Caribbean islands. It is located about 53 miles north-east of the region's lowest point, Lake Enriquillo. "
      ),
      AttractionModel(
        "r1a6",
        "Carnaval Vegano",
        "La Vega",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-vegano.jpg",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_vegano.mp4",
        "The Dominican Republic’s African heritage is reflected in the wildly colorful masks and costumes that are brought out and into the streets for the annual El Carnaval de la Vega celebrating the pre-Lent season, one of the oldest and most popular Dominican traditions. "
      ),
      AttractionModel(
        "r1a7",
        "Monumento a los Héroes",
        "Santiago",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/monumento-heroes.jpg",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/monumento_santiago.mp4",
        "The Monumento a los Héroes de la Restauración is a monument in the city of Santiago de los Caballeros in the Dominican Republic. It was originally built during the dictatorship of Rafael Leónidas Trujillo in 1944 as \"Trujillo's Monument to Peace.\" He ordered its construction in his own honor."
      ),
      AttractionModel(
        "r1a9",
        "Carnaval de Santiago",
        "Santiago",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland/carnaval-santiago.jpg",
        "http://api.drcoderz.com/aws_drtourismskill_imgs/videos/carnaval_santiago.mp4",
        "Carnaval de Santiago is the second most popular Carnival in the country after La Vega. It’s one of the most creative and colorful, and among the liveliest in crowd participation around the city’s iconic Restoration Heroes Monument. "
      )
    ]);

    return allModels;
  }
  static String currentAttraction;

  static AttractionModel getCurrentAttraction() {
    return allAttractions().firstWhere((a) => a.id == currentAttraction);
  }
}

class AttractionModel {
  String id;
  String name;
  String province;
  String img;
  String video;
  String description;

  AttractionModel(this.id, this.name, this.province, this.img, this.video, this.description);
}

class ToursyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MainListScreen();
  }
}

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Timer.run(() {
      new Timer(new Duration(days: 0, hours: 0, minutes: 0, seconds: 2, microseconds: 0, milliseconds: 0), () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainListScreen())
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

class MainListScreen extends StatelessWidget {
  
  List<Widget> getAllCards(BuildContext context) {
    List<Widget> allCards = List<Widget>();

    for(var attraction in Repository.allAttractions())
    {
      allCards.add(Container(
          padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
            elevation: 3.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ) ,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.network(attraction.img),
                Container(
                  height: 100.0,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, 0.8), Colors.transparent], // whitish to gray
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(attraction.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold)),
                      Text(attraction.province, 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic))
                    ],
                  ),
                )
              ],
            )),
            onTap: () {
              Repository.currentAttraction = attraction.id;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttractionDetails())
              );
            },
            ))
      );
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
              children: getAllCards(context)
            ),
            ListView(),
            ListView()
          ],
        )
      )
      )
    );
  }
}

class AttractionDetails extends StatelessWidget {

  final AttractionModel currentAttraction = Repository.getCurrentAttraction();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(84, 192, 160, 1.0),
        title: Text(currentAttraction.name)
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "mainHero",
              child: Image.network(currentAttraction.img),
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
                  Text(
                    currentAttraction.description,
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                    textAlign: TextAlign.left
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

