import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pi_flutter/models/buy_model.dart';
import 'package:pi_flutter/models/cart_model.dart';
import 'dart:convert' as convert;
import 'dart:convert' show Utf8Decoder, utf8, json;

import 'package:pi_flutter/models/product_model.dart';

class ApiBuy {
  final http.Client httpClient;
  ApiBuy({required this.httpClient});

  Future<List<dynamic>> getBuy() async {
    List<dynamic> resp;
    resp = [];

    var url = Uri.parse('http://10.0.2.2:3000/sale');

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
            var el = BuyModel.fromJson(product);
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

    return resp;
  }

  Future<void> postBuy(product) async {
    var newproduct =
        BuyModel(userId: 1, date: DateTime.now().toString(), products: product)
            .toJson();

    print(convert.jsonEncode(newproduct));
    print("namoroooooooooooooooooooooo nunca");
    var url = Uri.parse('http://10.0.2.2:3000/sale');

    try {
      var response = await httpClient.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: convert.jsonEncode(newproduct));

      // if (response.statusCode != 200) {
      //   print('errooooo');
      //   throw "Erro: Não foi possível acessar sua requisição";
      // }
    } catch (e) {
      throw "$e";
    }
  }
}
