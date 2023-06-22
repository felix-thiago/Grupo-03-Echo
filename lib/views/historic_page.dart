// ignore_for_file: prefer_const_constructors

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pi_flutter/models/buy_model.dart';
import 'package:pi_flutter/models/cart_model.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_buy.dart';
import 'package:pi_flutter/provider/api_cart.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/buy_repository.dart';
import 'package:pi_flutter/repository/cart_repository.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:intl/intl.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  num total = 0;
  var quantity;
  var orderTotal;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BuyRepository(apiBuy: ApiBuy(httpClient: http.Client())).getBuy(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_cart_outlined),
                Text(
                  '0 compras efetuadas!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        }
        var buy = snapshot.data as List<dynamic>;
        return ListView.builder(
          itemCount: buy.length,
          itemBuilder: (context, index) {
            var product = buy[index].products;
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (context, index2) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    // color: Color.fromARGB(255, 152, 70, 70),
                    height: 175,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product[0]['product']['title'],
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    product[index2]['product']['image'],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Container(
                                color: Colors.white,
                                width: 200,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Quantidade:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          product[index2]['product']
                                              ['quantity'],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Valor:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          product[index2]['product']['total'],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Data:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          DateFormat.yMd().format(
                                              DateTime.parse(buy[index].date)),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 5,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
