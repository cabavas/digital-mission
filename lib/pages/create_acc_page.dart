import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1e1b3c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/icon.png'),
            SizedBox(height: 50),
            AuthForm(),
          ],
        ),
      ),
    );
  }
}
