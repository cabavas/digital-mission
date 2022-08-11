import 'package:flutter/material.dart';

class LostPasswordPage extends StatefulWidget {
  LostPasswordPage({Key? key}) : super(key: key);

  @override
  State<LostPasswordPage> createState() => _LostPasswordPageState();
}

class _LostPasswordPageState extends State<LostPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
              Text(
                'Um código foi enviado para o e-mail que você usou para fazer o cadastro, digite abaixo o código para prosseguir com a alteração de senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text('*********.reid@example.com',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Image.asset(
                'assets/img/lost.png',
                height: 80,
                width: 300,
              ),
              SizedBox(height: 25),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Não recebi o código',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/reset-password'),
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
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
