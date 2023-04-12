import 'package:flutter/material.dart';
import 'package:pi_flutter/components/carrouselcard.dart';
import 'package:pi_flutter/home_controller.dart';

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
      body: Padding(
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
                labelStyle: TextStyle(fontSize: 12),
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
            const CarrouselCard()
          ],
        ),
      ),
    );
  }
}
