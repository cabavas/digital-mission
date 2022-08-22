import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _isObscure = true;
  bool _isObscureConfirm = true;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff1e1b3c),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            width: deviceSize.width * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/img/icon.png'),
                const SizedBox(height: 10),
                const Text(
                  'Criar nova senha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: Color(0xff5b74a6)),
                    fillColor: const Color(0xff1e1b3c),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    suffixIconColor: const Color(0xff5b74a6),
                  ),
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureConfirm = !_isObscureConfirm;
                        });
                      },
                    ),
                    suffixIconColor: const Color(0xff5b74a6),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 50),
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
                          borderRadius: BorderRadius.circular(18)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 25)),
                  child: const Text('Continuar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
