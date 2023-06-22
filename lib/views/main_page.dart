import 'package:flutter/material.dart';
import 'package:pi_flutter/components/carrousel_card.dart';
import 'package:pi_flutter/components/category_scroll.dart';
import 'package:pi_flutter/home_controller.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pi_flutter/views/cart_page.dart';
import 'package:pi_flutter/views/historic_page.dart';
import 'package:pi_flutter/views/home_page.dart';
import 'package:pi_flutter/views/login_page.dart';
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  Widget setPage() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CartPage();
      case 2:
        return HistoricPage();
      default:
        return HomePage();
    }
  }

  PreferredSizeWidget setAppBar() {
    switch (_currentIndex) {
      case 0:
        return AppBar(
          automaticallyImplyLeading: false,
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
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            )
          ],
        );
      case 1:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Carrinho de Compras',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.shopping_cart_outlined,
            //     color: Colors.black,
            //   ),
            // )
          ],
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Histórico de Compras',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            )
          ],
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
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
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        );
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        endDrawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Color.fromARGB(255, 255, 255, 255),
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50, left: 40),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 35,
                      ),
                    ),
                    Text(
                      'Conta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                  _key.currentState?.closeEndDrawer();
                },
                child: Container(
                  height: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Histórico de compras',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                },
                child: Container(
                  height: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            if (value == 2) {
              _key.currentState?.openEndDrawer();
            } else {
              setState(() {
                _currentIndex = value;
              });
            }
          },
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "PEDIDO"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "CONTA"),
          ],
        ),
        appBar: setAppBar(),
        body: setPage());
  }
}
