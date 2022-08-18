// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mission/components/auth.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, this.validator}) : super(key: key);

  final String? Function(String?)? validator;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final auth = Auth();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _pixController = TextEditingController();
  final _instagramController = TextEditingController();
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
                    validator: (name) {
                      if (name != null && name.length < 3) {
                        return 'O nome deve ter mais de 2 ccaracteres.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (name) => _authData['name'] = name,
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
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Digite um email válido.'
                            : null,
                    onChanged: (email) => _authData['email'] = email,
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
                    validator: (instagram) {
                      if (instagram != null && !instagram.startsWith('@')) {
                        return 'O usuário deve começar com @.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (instagram) =>
                        _authData['instagram'] = instagram,
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
                    validator: (pix) {
                      if (pix!.isEmpty) {
                        return 'Digite uma chave Pix';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (pix) => _authData['pix'] = pix,
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
                    validator: (password) {
                      if (password != null && password.length < 6) {
                        return 'A senha deve ter pelo menos 6 carateres.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (password) => _authData['password'] = password,
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
                    validator: (confirmPassword) {
                      if (confirmPassword!.isEmpty ||
                          confirmPassword != _authData['password']) {
                        return 'As senhas informadas não conferem.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                final _isValidForm = _formKey.currentState!.validate();
                if (_isValidForm) {
                  auth.createUser(_authData);
                  Navigator.pushNamed(context, '/success');
                }
              },
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
