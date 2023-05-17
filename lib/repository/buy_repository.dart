import 'package:pi_flutter/models/cart_model.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_buy.dart';
import 'package:pi_flutter/provider/api_cart.dart';

class BuyRepository {
  final ApiBuy apiBuy;

  BuyRepository({required this.apiBuy});

  Future<List<dynamic>> getBuy() {
    // print(apiCart.getProduct());
    return apiBuy.getBuy();
  }

  void postBuy(product) {
    // print(apiCart.getProduct());
    apiBuy.postBuy(product);
  }
}
