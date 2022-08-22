import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mission/components/auth.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, this.validator}) : super(key: key);

  final String? Function(String?)? validator;
  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  final auth = Auth();
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _authData = {
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
        color: const Color(0xff1e1b3c),
        width: deviceSize.width * 0.90,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Color(0xff5b74a6)),
                      fillColor: Color(0xff1e1b3c),
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                    validator: (name) {
                      if (name != null && name.length < 3) {
                        return 'O nome deve ter mais de 2 caracteres.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (name) => _authData['name'] = name,
                  ),
                  const SizedBox(height: 2),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 2),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 2),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 2),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: Color(0xff5b74a6)),
                      fillColor: const Color(0xff1e1b3c),
                      filled: true,
                      suffixIcon: IconTheme(
                        data: const IconThemeData(
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
                      suffixIconColor: const Color(0xff5b74a6),
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
                  const SizedBox(height: 2),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: _isObscureConfirm,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: const TextStyle(color: Color(0xff5b74a6)),
                      fillColor: const Color(0xff1e1b3c),
                      filled: true,
                      suffixIcon: IconTheme(
                        data: const IconThemeData(
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
                      suffixIconColor: const Color(0xff5b74a6),
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                final isValidForm = _formKey.currentState!.validate();
                if (isValidForm) {
                  auth.createUser(context, _authData);
                }
              },
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: const Color(0xff4267b2),
                  textStyle: const TextStyle(
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
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
