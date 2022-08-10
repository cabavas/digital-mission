// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xff1e1b3c),
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xff1e1b3c),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xff1e1b3c),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xff1e1b3c),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xff1e1b3c),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          // child: Column(
          //   children: [
          //     TextFormField(
          //       style: TextStyle(color: Colors.black),
          //       decoration: InputDecoration(labelText: 'Nome'),
          //       keyboardType: TextInputType.text,
          //       onSaved: (name) => _authData['name'] = name ?? '',
          //       validator: (_email) {
          //         final email = _email ?? '';
          //         if (email.trim().isEmpty || !email.contains('@')) {
          //           return 'Informe um e-mail válido.';
          //         }
          //         return null;
          //       },
          //     ),
          //     TextFormField(
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(labelText: 'E-mail'),
          //       keyboardType: TextInputType.emailAddress,
          //       onSaved: (email) => _authData['email'] = email ?? '',
          //       validator: (_name) {
          //         final name = _name ?? '';
          //         if (name.length < 4) {
          //           return 'Informe um e-mail válido.';
          //         }
          //         return null;
          //       },
          //     ),
          //     TextFormField(
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(labelText: '@Instagram'),
          //       keyboardType: TextInputType.emailAddress,
          //       onSaved: (instagram) =>
          //           _authData['instagram'] = instagram ?? '',
          //       validator: (_instagram) {
          //         final instagram = _instagram ?? '';
          //         if (instagram.trim().isEmpty || !instagram.contains('@')) {
          //           return 'Informe um @ válido.';
          //         }
          //         return null;
          //       },
          //     ),
          //     TextFormField(
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(labelText: 'Chave Pix'),
          //       keyboardType: TextInputType.text,
          //       onSaved: (pix) => _authData['pix'] = pix ?? '',
          //       validator: (_pix) {
          //         final pix = _pix ?? '';
          //         if (pix.trim().isEmpty || !pix.contains('@')) {
          //           return 'Informe um e-mail válido.';
          //         }
          //         return null;
          //       },
          //     ),
          //     TextFormField(
          //       style: TextStyle(color: Colors.black),
          //       decoration: InputDecoration(labelText: 'Senha'),
          //       keyboardType: TextInputType.emailAddress,
          //       obscureText: true,
          //       controller: _passwordController,
          //       onSaved: (password) => _authData['password'] = password ?? '',
          //       validator: (_password) {
          //         final password = _password ?? '';
          //         if (password.isEmpty || password.length < 5) {
          //           return 'Informe uma senha válida';
          //         }
          //         return null;
          //       },
          //     ),
          //     SizedBox(height: 20),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text('ENTRAR'),
          //     ),
          //     Spacer(),
          //   ],
          // ),
        ),
      ),
    );
  }
}
