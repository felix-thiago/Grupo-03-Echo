import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show Utf8Decoder, utf8, json;

import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/models/user_model.dart';

class ApiUser {
  final http.Client httpClient;
  ApiUser({required this.httpClient});

  Future<bool> login(username, password) async {
    List<dynamic> resp;
    resp = [];
    var body = {"username": username, "password": password};
    var url = Uri.parse('https://fakestoreapi.com/auth/login');
    print(body);
    try {
      var response = await httpClient.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: json.encode(body));

      if (response.statusCode == 200) {
        List<int> codeUnitsResponse = response.body.codeUnits;
        var utf8Response = const Utf8Decoder().convert(codeUnitsResponse);
        var jsonResponse = convert.jsonDecode(utf8Response);
        // print(jsonResponse);
        return true;
      } else {
        print('errooooo');
        throw "Erro: Não foi possível acessar sua requisição";
        return false;
      }
    } catch (e) {
      throw "$e";
    }

    // print(resp);
    return true;
  }
}
