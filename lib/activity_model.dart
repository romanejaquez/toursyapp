class ActivityModel {
  String id;
  String name;
  String img;
  List<String> attractions;

  ActivityModel.fromJSON(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    
    attractions = List<String>();
    for(String aId in json['attractions']) {
      attractions.add(aId);
    }
  }
}