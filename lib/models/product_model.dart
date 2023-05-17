class ProductModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String image;
  final price;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map toJson() {
    return {'id': id, 'title': title, 'price': price};
  }
}
