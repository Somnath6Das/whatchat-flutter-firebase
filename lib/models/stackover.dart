class StackOverModel {
  final String title;
  final String docid;
  StackOverModel({
    required this.title,
    required this.docid,
  });

  factory StackOverModel.fromJson(Map<String, dynamic> json) =>
      StackOverModel(title: json["title"], docid: json["docid"]);

  toList() {}
}
