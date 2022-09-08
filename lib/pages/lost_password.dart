import 'package:flutter/material.dart';

class LostPasswordPage extends StatefulWidget {
  const LostPasswordPage({Key? key}) : super(key: key);

  @override
  State<LostPasswordPage> createState() => _LostPasswordPageState();
}

class _LostPasswordPageState extends State<LostPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Um código foi enviado para o e-mail que você usou para fazer o cadastro, digite abaixo o código para prosseguir com a alteração de senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text('*********.reid@example.com',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Image.asset(
                'assets/img/lost.png',
                height: 80,
                width: 300,
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Não recebi o código',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/reset-password'),
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xffffffff), backgroundColor: const Color(0xff4267b2),
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
    );
  }
}
