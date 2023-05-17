import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show Utf8Decoder, utf8, json;

import 'package:pi_flutter/models/product_model.dart';

class ApiProduct {
  final http.Client httpClient;
  ApiProduct({required this.httpClient});

  Future<List<dynamic>> getProduct(int itemsQuantity) async {
    List<dynamic> resp;
    resp = [];

    var url =
        Uri.parse('https://fakestoreapi.com/products?limit=$itemsQuantity');

    try {
      var response = await httpClient
          .get(url, headers: {'Accept': 'application/json; charset=UTF-8'});

      if (response.statusCode == 200) {
        List<int> codeUnitsResponse = response.body.codeUnits;
        var utf8Response = const Utf8Decoder().convert(codeUnitsResponse);
        var jsonResponse = convert.jsonDecode(utf8Response);
        // print(jsonResponse);

        jsonResponse.forEach(
          (product) {
            var el = ProductModel.fromJson(product);
            resp.add(el);
          },
        );
      } else {
        print('errooooo');
        throw "Erro: Não foi possível acessar sua requisição";
      }
    } catch (e) {
      throw "$e";
    }

    // print(resp);
    return resp;
  }
}
