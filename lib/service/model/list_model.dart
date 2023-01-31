class ListModel {
  String? id;
  String? name;
  String? thumb;

  ListModel({
    this.id,
    this.name,
    this.thumb,
  });

  ListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['thumb'] = thumb;
    return data;
  }
}
