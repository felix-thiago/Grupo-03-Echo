import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pi_flutter/models/cart_model.dart';
import 'dart:convert' as convert;
import 'dart:convert' show Utf8Decoder, utf8, json;

import 'package:pi_flutter/models/product_model.dart';

class ApiCart {
  final http.Client httpClient;
  ApiCart({required this.httpClient});

  Future<List<dynamic>> getCart() async {
    List<dynamic> resp;
    resp = [];

    var url = Uri.parse('http://10.0.2.2:3000/cart');

    try {
      var response = await httpClient
          .get(url, headers: {'Accept': 'application/json; charset=UTF-8'});
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<int> codeUnitsResponse = response.body.codeUnits;
        var utf8Response = const Utf8Decoder().convert(codeUnitsResponse);
        var jsonResponse = convert.jsonDecode(utf8Response);
        // print(jsonResponse);

        jsonResponse.forEach(
          (product) {
            var el = {
              "product": CartProductModel.fromJson(product['product']),
              "id": product['id']
            };
            resp.add(el);
          },
        );
        print("teste");
      } else {
        print('errooooo');
        throw "Erro: Não foi possível acessar sua requisição";
      }
    } catch (e) {
      throw "$e";
    }

    return resp;
  }

  Future<void> postCart(ProductModel product, int quantity, orderTotal) async {
    var newproduct = CartProductModel(
      id: product.id.toString(),
      title: product.title,
      price: product.price.toString(),
      category: product.category,
      description: product.description,
      image: product.image,
      quantity: quantity.toString(),
      total: orderTotal.toString(),
    ).toJson();

    var body = {"product": newproduct};
    print(json.encode(body));
    var url = Uri.parse('http://10.0.2.2:3000/cart/');

    try {
      var response = await httpClient.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: convert.jsonEncode(body));

      // if (response.statusCode != 200) {
      //   print('errooooo');
      //   throw "Erro: Não foi possível acessar sua requisição";
      // }
    } catch (e) {
      throw "$e";
    }
  }

  Future<void> updateCart(product, int quantity, orderTotal, id) async {
    var newproduct = CartProductModel(
      id: product.id.toString(),
      title: product.title,
      price: product.price.toString(),
      category: product.category,
      description: product.description,
      image: product.image,
      quantity: quantity.toString(),
      total: orderTotal.toString(),
    ).toJson();

    var body = {"product": newproduct};
    // print(json.encode(body));
    var url = Uri.parse('http://10.0.2.2:3000/cart/$id');

    try {
      var response = await httpClient.put(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: convert.jsonEncode(body));

      // if (response.statusCode != 200) {
      //   print('errooooo');
      //   throw "Erro: Não foi possível acessar sua requisição";
      // }
    } catch (e) {
      throw "$e";
    }
  }

  Future<void> deleteCart(id) async {
    var url = Uri.parse('http://10.0.2.2:3000/cart/$id');

    try {
      var response = await httpClient.delete(
        url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        print('errooooo');
        throw "Erro: Não foi possível acessar sua requisição";
      }
    } catch (e) {
      throw "$e";
    }
  }
}
