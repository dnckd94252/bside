class DetailModel {
  String company, title, date, moderator, introduce;

  DetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = json['date'],
        company = json['company'],
        moderator = json['moderator'],
        introduce = json['introduce'];
}
