import 'package:flutter/material.dart';

import '../components/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e1b3c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/icon.png'),
            const SizedBox(height: 120),
            const LoginButton(
              text: 'Entrar com o Google',
              textColor: 0xff1b1e3c,
              backgroundColor: 0xffffffff,
              route: '/home-page',
              image: 'assets/img/google.png',
            ),
            const SizedBox(height: 5),
            const LoginButton(
              text: 'Entrar com o Facebook',
              textColor: 0xffffffff,
              backgroundColor: 0xff4267B2,
              route: '/lost-password',
              image: 'assets/img/Facebook.png',
            ),
            const SizedBox(height: 5),
            const LoginButton(
              text: 'Entrar com o Email',
              textColor: 0xffffffff,
              backgroundColor: 0xff242850,
              route: '/email-login',
              image: 'assets/img/mail.png',
            ),
            const SizedBox(height: 5),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/create-account'),
                style: TextButton.styleFrom(
                    primary: const Color(0xffffffff),
                    backgroundColor: const Color(0xff1b1e3c),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                child: const Text('Novo aqui? Crie uma conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
