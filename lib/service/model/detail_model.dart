class DetailModel {
  String? company;
  String? title;
  String? date;
  String? moderator;
  String? introduce;

  DetailModel(
      {this.company, this.title, this.date, this.moderator, this.introduce});

  DetailModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    title = json['title'];
    date = json['date'];
    moderator = json['moderator'];
    introduce = json['introduce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['title'] = title;
    data['date'] = date;
    data['moderator'] = moderator;
    data['introduce'] = introduce;
    return data;
  }
}
