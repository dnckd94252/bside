class AgendaModel {
  String title, content, type;
  double id;
  
  AgendaModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        type = json['type'],
        id = json['id'];
}
