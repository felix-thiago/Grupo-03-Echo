import 'package:flutter/material.dart';
import 'package:pi_flutter/home_controller.dart';
import 'package:pi_flutter/home_page.dart';
import 'package:pi_flutter/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(
        child: LoginPage(),
      ),
    );
  }
}
