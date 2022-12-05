class Tournament {
  final String img;
  final String name;
  final String date;
  final String? description;

  Tournament(
      {required this.img,
      required this.name,
      required this.date,
      this.description});

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
      img: json["img"],
      name: json["name"],
      date: json["date"],
      description: json["description"]);

  Map<String, dynamic> get toJson =>
      {"img": img, "name": name, "date": date, "description": description};
}
