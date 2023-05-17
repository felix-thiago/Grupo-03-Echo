class CartProductModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String image;
  final price;
  final String quantity;
  final total;

  CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.quantity,
    required this.total,
  });

  factory CartProductModel.fromJson(Map json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'quantity': quantity,
      'image': image,
      'description': description,
      'total': total.toString(),
    };
  }
}
