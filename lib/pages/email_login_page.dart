import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/auth.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

bool _isObscure = true;

class _EmailLoginPageState extends State<EmailLoginPage> {
  final auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try {
      await auth.signInWithEmail(_email, _password);
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
    } catch (e) {
      print('DEU ERRO Ó');
    }
    Navigator.pushReplacementNamed(context, '/home-page');
  }

  @override
  Widget build(BuildContext context) {
    print('##############################################');
    print(FirebaseAuth.instance.currentUser);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1e1b3c),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/icon.png'),
              SizedBox(height: 50),
              Container(
                width: deviceSize.width * 0.90,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                            child: Icon(Icons.mail_outlined),
                          ),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: Color(0xff5b74a6)),
                          fillColor: Color(0xff1e1b3c),
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                            child: Icon(Icons.lock_outline_rounded),
                          ),
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color(0xff5b74a6)),
                          fillColor: Color(0xff1e1b3c),
                          filled: true,
                          suffixIcon: IconTheme(
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/lost-password'),
                          child: Text(
                            'Esqueci a senha',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      TextButton(
                        onPressed: () => _submit(),
                        style: TextButton.styleFrom(
                          primary: const Color(0xffffffff),
                          backgroundColor: const Color(0xff4267b2),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                        ),
                        child: Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
