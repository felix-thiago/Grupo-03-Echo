import 'package:flutter/material.dart';
import 'package:pi_flutter/components/carrousel_card.dart';
import 'package:pi_flutter/components/category_scroll.dart';
import 'package:pi_flutter/home_controller.dart';
import 'package:pi_flutter/models/product_model.dart';
import 'package:pi_flutter/provider/api_product.dart';
import 'package:pi_flutter/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pi_flutter/views/cart_page.dart';
import 'package:pi_flutter/views/home_page.dart';
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
              onPressed: () {},
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
            IconButton(
              onPressed: () {},
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
              onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
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
