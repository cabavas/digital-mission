import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1e3c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Conta criada com sucesso',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Image.asset('assets/img/icon.png'),
            const SizedBox(height: 150),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home-page');
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xff4267b2),
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
              child: const Text('Fazer Login'),
            ),
          ],
        ),
      ),
    );
  }
}
