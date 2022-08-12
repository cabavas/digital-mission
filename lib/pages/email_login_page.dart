import 'package:flutter/material.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

bool _isObscure = true;

class _EmailLoginPageState extends State<EmailLoginPage> {
  @override
  Widget build(BuildContext context) {
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
                      SizedBox(height: 50),
                      TextButton(
                        onPressed: () {},
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
                      )
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
