import 'package:pi_flutter/models/cart_model.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_cart.dart';

class CartRepository {
  final ApiCart apiCart;

  CartRepository({required this.apiCart});

  Future<List<dynamic>> getCart() {
    // print(apiCart.getProduct());
    return apiCart.getCart();
  }

  void postCart(ProductModel product, int quantity, orderTotal) {
    // print(apiCart.getProduct());
    apiCart.postCart(product, quantity, orderTotal);
  }

  void updateCart(product, int quantity, orderTotal, id) {
    // print(apiCart.getProduct());
    apiCart.updateCart(product, quantity, orderTotal, id);
  }

  void deleteCart(id) {
    // print(apiCart.getProduct());
    apiCart.deleteCart(id);
  }
}
