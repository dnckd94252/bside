class LocationModel {
  int id;
  String main;
  String sub;

  LocationModel({
    required this.id,
    required this.main,
    required this.sub,
  });

  LocationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        sub = json['sub'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['sub'] = sub;
    return data;
  }
}
