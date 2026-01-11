class Swipermodel {
  final int id;
  final String image;

  Swipermodel({required this.id, required this.image});

  factory Swipermodel.fromJson(Map<String, dynamic> json) {
    return Swipermodel(
      id: json['id'],
      image: json['image'],
    );
  }
}
