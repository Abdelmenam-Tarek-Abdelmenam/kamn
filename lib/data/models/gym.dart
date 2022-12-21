class Gym {
  String name;
  String address;
  double price;
  String img;
  GymType type;
  double rating;
  List<String> amenities;
  // Spa,Jacuzzi
  List<String> reviews;
  List<String> images;
  Map<String, String> subscriptions;
  double lat;
  double lon;
  List<GymCoach> coaches;

  Gym({
    required this.name,
    required this.address,
    required this.price,
    required this.img,
    required this.type,
    required this.rating,
    required this.amenities,
    required this.images,
    required this.reviews,
    required this.lat,
    required this.lon,
    required this.subscriptions,
    required this.coaches,
  });

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
      name: json['name'],
      address: json['address'],
      price: json['price'],
      img: json['img'],
      type: GymType.values[json['type']],
      rating: json['rating'],
      images: List<String>.from(json['images'] ?? []),
      reviews: List<String>.from(json['reviews'] ?? []),
      amenities: json['amenities'].split(","),
      lat: json['lat'],
      lon: json['lon'],
      subscriptions: Map<String, String>.from(json['subscriptions']),
      coaches: List<GymCoach>.from(
          json['coaches'].map((e) => GymCoach.fromJson(e))));

  Map<String, dynamic> get toJson => {
        "name": name,
        "address": address,
        "price": price,
        "img": img,
        "type": type.index,
        "rating": rating,
        "amenities": amenities.join(","),
        "images": images,
        "reviews": reviews,
        "lon": lon,
        "lat": lat,
        "subscriptions": subscriptions,
        "coaches": coaches.map((e) => e.toJson).toList(),
      };
}

enum GymType {
  mix,
  separate;

  @override
  String toString() {
    switch (this) {
      case GymType.mix:
        return "Mix";
      case GymType.separate:
        return "Separate";
    }
  }
}

class GymCoach {
  String name;
  String description;
  String img;

  GymCoach({
    required this.img,
    required this.name,
    required this.description,
  });

  factory GymCoach.fromJson(Map<String, dynamic> json) => GymCoach(
      img: json['img'], name: json['name'], description: json['description']);

  Map<String, dynamic> get toJson =>
      {"img": img, "name": name, "description": description};
}
