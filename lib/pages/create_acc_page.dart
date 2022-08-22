import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({Key? key}) : super(key: key);

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
              const AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
