import 'package:flutter/material.dart';
import 'package:pi_flutter/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Material(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          'Bem-vindo ao Echo!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (email == 'senac.sp@senac.com.br' &&
                              password == '1234') {
                            print('Correto');
                            //Navigator.of(context).push(
                            Navigator.of(context).pushReplacement(
                                //-- Para eliminar o botao voltar da HomePage
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            print('Login Invalido');
                          }
                        },
                        child: Text('Entrar'),
                      )
                    ],
                  )))),
    );
  }
}
