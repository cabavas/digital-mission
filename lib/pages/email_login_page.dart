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
  String errorMessage = '';

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try {
      const CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.red,);
      await auth.signInWithEmail(_email, _password);
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home-page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha Inválida';
      } else {
        errorMessage = 'Ocorreu um erro inesperado';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xff045eac),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1e1b3c),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/icon.png'),
              const SizedBox(height: 50),
              SizedBox(
                width: deviceSize.width * 0.90,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
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
                        style: const TextStyle(color: Colors.white),
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: const IconTheme(
                            data: IconThemeData(
                              color: Colors.white,
                            ),
                            child: Icon(Icons.lock_outline_rounded),
                          ),
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
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/lost-password'),
                          child: const Text(
                            'Esqueci a senha',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
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
                        child: const Text('Entrar'),
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
