import 'package:sampleapp/attraction_model.dart';
import 'package:sampleapp/repository.dart';

class ActivityModel {
  String id;
  String name;
  String img;
  List<AttractionModel> attractions;

  ActivityModel.fromJSON(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    
    var attractionIds = List<String>();
    for(String aId in json['attractions']) {
      attractionIds.add(aId);
    }

    attractions = Repository.getAttractionsFromActivity(attractionIds);
  }
}