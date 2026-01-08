class Product {
  final int id;
  final String category;
  final String title;
  final String image;
  final String description;
  final int price;
  final int dealprice;
  final bool hasdeal;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.dealprice,
    required this.hasdeal,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      dealprice: json['dealprice'],
      hasdeal: json['hasdeal'],
    );
  }
}
