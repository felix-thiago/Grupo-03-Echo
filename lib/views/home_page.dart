import 'package:flutter/material.dart';
import 'package:pi_flutter/components/carrousel_card.dart';
import 'package:pi_flutter/components/category_scroll.dart';
import 'package:pi_flutter/home_controller.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {},
            ),
          ),
          BottomNavigationBarItem(
            label: "Pedido",
            icon: IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {},
            ),
          ),
          BottomNavigationBarItem(
            label: "Conta",
            icon: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Echo',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  // setState(() {
                  //   email = text;
                  // });
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
                height: 400,
                child: FutureBuilder(
                  future: ProductRepository(
                          apiProduct: ApiProduct(httpClient: http.Client()))
                      .getProduct(),
                  builder: (context, snapshot) {
                    // print(product);
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<dynamic> product = snapshot.data as List<dynamic>;
                      return GridView.builder(
                        itemCount: product.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 30),
                        primary: false,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: ((context, index) {
                          return Column(
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
                                            product[index].image))),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  product[index].title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "RS ${product[index].price}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              )
                            ],
                          );
                        }),
                      );
                    } else {
                      return Placeholder();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
