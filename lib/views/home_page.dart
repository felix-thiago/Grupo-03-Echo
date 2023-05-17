import 'package:flutter/material.dart';
import 'package:pi_flutter/components/carrousel_card.dart';
import 'package:pi_flutter/components/category_scroll.dart';
import 'package:pi_flutter/home_controller.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pi_flutter/views/cart_page.dart';
import 'package:pi_flutter/views/produto_page.dart';
import 'package:shimmer/shimmer.dart';

import '../components/custom_bottom_navigation_bar.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = HomeController.of(context);
//     final size = MediaQuery.of(context).size;
//     final navigation = Navigator.of(context);
//     final theme = Theme.of(context);

//
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;
  var _currentIndex = 0;
  List<dynamic> product = [];
  List<dynamic> productFiltered = [];
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                productFiltered = product
                    .where((element) => element.title
                        .trim()
                        .toLowerCase()
                        .startsWith(value.trim().toLowerCase()))
                    .toList();
                if (productFiltered.isEmpty) {
                  print('vazio');
                  productFiltered = product;
                }
                setState(() {});
                print(value);
                print(productFiltered[0].title);
                print('testebom');
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.black,
                contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                labelText: 'O que você procura?',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 248, 248, 248),
              ),
            ),
            const CarrouselCard(),
            const CategoryScroll(),
            Container(
              height: MediaQuery.of(context).size.height * 1.4,
              child: FutureBuilder(
                future: ProductRepository(
                        apiProduct: ApiProduct(httpClient: http.Client()))
                    .getProduct(8),
                builder: (context, snapshot) {
                  // print(product);
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    product = snapshot.data as List<dynamic>;
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: productFiltered.isNotEmpty
                          ? productFiltered.length
                          : product.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 30),
                      primary: false,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            //-- Para eliminar o botao voltar da HomePage
                            MaterialPageRoute(
                              builder: (context) => ProdutoPage(
                                product: product[index],
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 170,
                                width: 150,
                                padding: const EdgeInsets.all(8),
                                // color: Colors.teal[100],
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        productFiltered.isNotEmpty
                                            ? productFiltered[index].image
                                            : product[index].image),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  productFiltered.isNotEmpty
                                      ? productFiltered[index].title
                                      : product[index].title,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "R\$ ${productFiltered.isNotEmpty ? productFiltered[index].price : product[index].price}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  } else {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 30),
                      primary: false,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Color.fromARGB(255, 193, 193, 193),
                                highlightColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  height: 170,
                                  width: 150,
                                  padding: const EdgeInsets.all(8),
                                  // color: Colors.teal[100],
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 221, 221),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(255, 193, 193, 193),
                                  highlightColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    padding: const EdgeInsets.all(8),
                                    // color: Colors.teal[100],
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Shimmer.fromColors(
                                  baseColor: Color.fromARGB(255, 193, 193, 193),
                                  highlightColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  child: Container(
                                    height: 20,
                                    width: 60,
                                    padding: const EdgeInsets.all(8),
                                    // color: Colors.teal[100],
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 221, 221, 221),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
