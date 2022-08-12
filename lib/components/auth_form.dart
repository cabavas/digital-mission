// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, this.validator}) : super(key: key);

  final String? Function(String?)? validator;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'name': '',
    'password': '',
    'instagram': '',
    'pix': '',
    'email': '',
  };

  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        color: Color(0xff1e1b3c),
        width: deviceSize.width * 0.90,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (name) => _authData['name'] = name ?? '',
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.length < 3) {
                        return 'Nome precisa ter mais de 2 caracteres.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: '@Instagram',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Chave Pix',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
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
                      suffixIconColor: Color(0xff5b74a6),
                    ),
                    controller: _passwordController,
                    onSaved: (password) =>
                        _authData['password'] = password ?? '',
                    validator: (_password) {
                      final password = _password ?? '';
                      if (password.isEmpty || password.length < 6) {
                        return 'A senha deve ter mais de 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 2),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _isObscureConfirm,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                      suffixIcon: IconTheme(
                        data: IconThemeData(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(_isObscureConfirm
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscureConfirm = !_isObscureConfirm;
                            });
                          },
                        ),
                      ),
                      suffixIconColor: Color(0xff5b74a6),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (_password) {
                      final password = _password ?? '';
                      if (password != _passwordController.text) {
                        return 'As senhas não conferem.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/success'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color(0xff4267b2),
                  textStyle: TextStyle(
                    fontSize: 16,
                    backgroundColor: Color(0xff4267b2),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
