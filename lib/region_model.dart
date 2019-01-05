import 'package:sampleapp/attraction_model.dart';

class RegionModel {
  String id;
  String region;
  String img;
  List<AttractionModel> attractions;

  RegionModel.fromJSON(dynamic json) {
    id = json['id'];
    region = json['region'];
    img = json['img'];

    attractions = List<AttractionModel>();
    for(var attr in json['attractions'])
    {
      attractions.add(AttractionModel.fromJSON(attr));
    }
  }
}