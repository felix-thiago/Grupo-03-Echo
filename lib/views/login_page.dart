import 'package:flutter/material.dart';
import 'package:pi_flutter/views/main_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool seePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Material(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          'Bem-vindo ao Echo!',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DM Sans'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                        child: Text(
                          'Por favor, insira seus dados para realizar o login:',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 131, 133, 137)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text('Email/ Telefone',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                email = text;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 25),
                              labelText:
                                  'Digite seu endereço de e-mail/telefone',
                              labelStyle: TextStyle(fontSize: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              filled: true,
                              fillColor: Color.fromARGB(255, 232, 232, 232),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              'Senha',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                password = text;
                              });
                            },
                            obscureText: seePassword ? false : true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: seePassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    seePassword = !seePassword;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 25),
                              labelText: 'Insira a senha da conta',
                              labelStyle: TextStyle(fontSize: 15),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              filled: true,
                              fillColor: Color.fromARGB(255, 232, 232, 232),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 54, 105, 201)),
                          onPressed: email.isEmpty && password.isEmpty
                              ? null
                              : () {
                                  if (email == 'senac.sp@senac.com.br' &&
                                      password == '1234') {
                                    print('Correto');
                                    // Navigator.of(context).pushNamed('/home');
                                    Navigator.of(context).pushReplacement(
                                        //-- Para eliminar o botao voltar da HomePage
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  } else {
                                    print('Login Invalido');
                                  }
                                },
                          child: const Text('Entrar'),
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.16),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
