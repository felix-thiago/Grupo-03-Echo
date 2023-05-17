class BuyModel {
  int? id;
  final int userId;
  final String date;
  final products;

  BuyModel(
      {this.id,
      required this.userId,
      required this.date,
      required this.products});

  factory BuyModel.fromJson(Map json) {
    return BuyModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: json['products'],
    );
  }

  Map toJson() {
    return {'id': id, 'userId': userId, 'date': date, 'products': products};
  }
}
