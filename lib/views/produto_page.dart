import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class ProdutoPage extends StatefulWidget {
  var product;
  ProdutoPage({super.key, this.product});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color.fromARGB(255, 54, 105, 201)),
          onPressed: () {},
          child: const Text('Adicionar ao carrinho'),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            wordSpacing: 3),
        title: const Text("Detalhes do produto"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: Container(
                    height: 170,
                    width: 150,
                    padding: const EdgeInsets.all(8),
                    // color: Colors.teal[100],
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      image: DecorationImage(
                        image: NetworkImage(widget.product.image),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    title: Text(
                      '${widget.product.title}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "R\$ ${widget.product.price}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '${widget.product.description}',
                    style: TextStyle(height: 1.8),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: const ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                    title: Text(
                      'Produto em destaque',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: ProductRepository(
                          apiProduct: ApiProduct(httpClient: http.Client()))
                      .getProduct(2),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<dynamic> product = snapshot.data as List<dynamic>;
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ProdutoPage(
                                    product: product[0],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 220,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              // color: Colors.teal[100],
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 0.5,
                                    offset: Offset(0,
                                        1), // Define o deslocamento da sombra (horizontal, vertical)
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          scale: 8,
                                          image: NetworkImage(product[0].image),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      product[0].title,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "R\$ ${product[0].price}",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ProdutoPage(
                                    product: product[1],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 220,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              // color: Colors.teal[100],
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 0.5,
                                    offset: Offset(
                                      0,
                                      1,
                                    ), // Define o deslocamento da sombra (horizontal, vertical)
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          scale: 8,
                                          image: NetworkImage(product[1].image),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      product[1].title,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "R\$ ${product[1].price}",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 193, 193, 193),
                            highlightColor: Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              height: 220,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              // color: Colors.teal[100],
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0,
                                          1), // Define o deslocamento da sombra (horizontal, vertical)
                                    ),
                                  ]),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                          Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 193, 193, 193),
                            highlightColor: Color.fromARGB(255, 255, 255, 255),
                            child: Container(
                              height: 220,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              // color: Colors.teal[100],
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0,
                                        1), // Define o deslocamento da sombra (horizontal, vertical)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
