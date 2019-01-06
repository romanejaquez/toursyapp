import 'package:flutter/material.dart';
import 'package:sampleapp/carousel_slider.dart';

class CarouselDemoStateful extends StatefulWidget
{
  int currentPage = 0;
  @override
  CarouselDemo createState() {
    return CarouselDemo();
  }

}

class CarouselDemo extends State<CarouselDemoStateful> {
    
  CarouselSlider instance;
  CarouselDemo() {
    instance = CarouselSlider(
    height: 500,
    updateCallback: (int page) {
      setState(() {
        widget.currentPage = page;
      });
    },
    items: imgList.map((url) {
      return Container(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        margin: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0, bottom: 60.0),
        child: Container(
          decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                blurRadius: 20.0,
                spreadRadius: 4.0,
                offset: Offset(0.0, 30.0)
              )
            ]
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(url,
            fit: BoxFit.cover,
            width: 600.0,
          ),
        ),
        )
      );
    }).toList(),
    viewportFraction: 0.7,
    aspectRatio: 2.0,
    autoPlay: false,
  );
  }
  static final List<String> imgList = [
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/centerisland.jpg',
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/east.jpg',
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/frontier.jpg',
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/north.jpg',
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/northeast.jpg',
    'http://api.drcoderz.com/aws_drtourismskill_imgs/byregion/southwest.jpg'
  ];

  static final List<String> names = [
    'Center of the Island',
    'East Region',
    'Border Region',
    'North Region',
    'Northeast Region',
    'Southwest Region'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {    // print(instance.nextPage());
    return MaterialApp(
      title: 'demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Carousel slider demo')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: instance
            ),
            Text(names[widget.currentPage])
          ],
        )
      )
    );
  }
}