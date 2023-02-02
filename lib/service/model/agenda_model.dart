class AgendaModel {
  int? id;
  String? title;
  String? type;
  String? content;

  AgendaModel({this.id, this.title, this.type, this.content});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    content = json['content'];
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['content'] = content;
    return data;
  }
}
