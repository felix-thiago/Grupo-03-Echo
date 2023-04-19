import 'package:flutter/material.dart';
import 'package:pi_flutter/home_controller.dart';
import 'views/login_page.dart';
import 'views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'DM Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeController(
        child: LoginPage(),
      ),
      routes: {
        // '/': (context) => HomeController(child: LoginPage()),
        '/login': (context) => HomePage(),
      },
    );
  }
}
