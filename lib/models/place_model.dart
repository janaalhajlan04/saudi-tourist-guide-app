class PlaceModel {
  final String? name;
  final String? country;
  final String? image;
  final String? desc;

  PlaceModel({this.name, this.country, this.image, this.desc});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'],
      country: json['country'],
      image: json['image'],
      desc: json['desc'],
    );
  }
}
