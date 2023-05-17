import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/provider/api_user.dart';

class UserRepository {
  final ApiUser apiUser;

  UserRepository({required this.apiUser});

  Future<bool> login(username, password) async {
    // print(apiProduct.getProduct());

    return await apiUser.login(username, password);
  }
}
