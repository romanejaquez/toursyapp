class AttractionModel {
  String id;
  String name;
  String province;
  String img;
  String video;
  String description;
  String fullDescription;

  AttractionModel(this.id, this.name, this.province, this.img, this.video, this.description);

  AttractionModel.fromJSON(dynamic json) {
    id = json['id'];
    name = json['name'];
    province = json['province'];
    img = json['img'];
    video = json['video'];
    description = json['description'];
    fullDescription = json['fullDescription'];
  }
}