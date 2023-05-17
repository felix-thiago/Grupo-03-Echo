import 'package:pi_flutter/provider/api_product.dart';

class ProductRepository {
  final ApiProduct apiProduct;

  ProductRepository({required this.apiProduct});

  Future<List<dynamic>> getProduct(int itemsQuantity) {
    // print(apiProduct.getProduct());
    return apiProduct.getProduct(itemsQuantity);
  }
}
