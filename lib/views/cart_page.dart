// ignore_for_file: prefer_const_constructors

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_buy.dart';
import 'package:pi_flutter/provider/api_cart.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/buy_repository.dart';
import 'package:pi_flutter/repository/cart_repository.dart';
import 'package:pi_flutter/repository/product_repository.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  num total = 0;
  var quantity;
  var orderTotal;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CartRepository(apiCart: ApiCart(httpClient: http.Client()))
            .getCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var product = snapshot.data as List<dynamic>;
            // print(product.length);
            total = 0;
            product.forEach(
              (element) {
                double teste = double.parse(element["product"].total);
                total = total + double.parse(teste.toStringAsFixed(2));
              },
            );
            if (product.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart_outlined),
                    Text(
                      'Carrinho vázio',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      // color: Colors.red,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        children: const [
                          Text('Taxa de Entrega: R\$ 50,00',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Prazo de Entrega: 3 dias úteis',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.2,
                      // color: Colors.red,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: product.length,
                        itemBuilder: (context, index) {
                          // orderTotal = product[index]['product'].total;
                          var quantity =
                              int.parse(product[index]['product'].quantity);
                          return Column(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            // padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            children: [
                              Text(
                                '${product[index]['product'].title}',
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              product[index]['product'].image),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      // alignment: Alignment.center,
                                      // color: Colors.red,
                                      width: 110,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Quantidade'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (quantity > 0) {
                                                    quantity--;
                                                    CartRepository(
                                                            apiCart: ApiCart(
                                                                httpClient: http
                                                                    .Client()))
                                                        .updateCart(
                                                            product[index]
                                                                ['product'],
                                                            int.parse(product[
                                                                            index]
                                                                        [
                                                                        'product']
                                                                    .quantity) -
                                                                1,
                                                            double.parse(product[
                                                                            index]
                                                                        [
                                                                        'product']
                                                                    .price) *
                                                                quantity,
                                                            product[index]
                                                                ["id"]);
                                                    setState(() {});
                                                  }
                                                },
                                                icon: Icon(Icons
                                                    .remove_circle_outline),
                                              ),
                                              Text(
                                                  '${product[index]['product'].quantity}'),
                                              IconButton(
                                                onPressed: () {
                                                  quantity++;
                                                  print('teste');
                                                  CartRepository(
                                                          apiCart: ApiCart(
                                                              httpClient:
                                                                  http
                                                                      .Client()))
                                                      .updateCart(
                                                          product[index]
                                                              ['product'],
                                                          int.parse(product[
                                                                          index]
                                                                      [
                                                                      'product']
                                                                  .quantity) +
                                                              1,
                                                          double.parse(product[
                                                                          index]
                                                                      [
                                                                      'product']
                                                                  .price) *
                                                              quantity,
                                                          product[index]["id"]);
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      // alignment: Alignment.center,
                                      // color: Colors.red,
                                      width: 105,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              'R\S ${double.parse(product[index]['product'].price) * int.parse(product[index]['product'].quantity)}'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  CartRepository(
                                                          apiCart: ApiCart(
                                                              httpClient: http
                                                                  .Client()))
                                                      .deleteCart(
                                                          product[index]["id"]);
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        // color: Colors.red,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(16),
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Desconto:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  // SizedBox(
                                  //   width: 120,
                                  // ),
                                  Text('R\$ 0,00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  // SizedBox(
                                  //   width: 120,
                                  // ),
                                  Text('R\$ ${total.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 54, 105, 201),
                                ),
                                onPressed: () {
                                  BuyRepository(
                                          apiBuy:
                                              ApiBuy(httpClient: http.Client()))
                                      .postBuy(product);
                                  product.forEach((element) {
                                    CartRepository(
                                            apiCart: ApiCart(
                                                httpClient: http.Client()))
                                        .deleteCart(element["id"]);
                                  });
                                  setState(() {});
                                },
                                child: const Text('Finalizar Compra'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
