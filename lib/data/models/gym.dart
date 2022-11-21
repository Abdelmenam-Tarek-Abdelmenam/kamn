const testImage1 =
    "https://metrosaga.com/wp-content/uploads/2020/05/Untitled-design-4-1.jpg";
const testImage2 =
    "https://pr1.nicelocal.ae/HuYTsHFZ5SaV70m7eEJiFw/640x360,q85/4px-BW84_n0QJGVPszge3NRBsKw-2VcOifrJIjPYFYkOtaCZxxXQ2ZxQkxfFFFrmj6ePV27Tl2w7t3qugr0qZPzJFTR8h7wYldczZH4iUAe0O_dE-P7QhQ";

class Gym {
  String name;
  String address;
  double price;
  String img;
  GymType type;
  double rating;

  Gym({
    required this.name,
    required this.address,
    required this.price,
    required this.img,
    required this.type,
    required this.rating,
  });
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
