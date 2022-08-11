// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mission/pages/login_page.dart';
import 'package:mission/pages/lost_password.dart';
import 'package:mission/pages/successful.dart';
import 'package:mission/utils/app_routes.dart';

import 'pages/create_acc_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Missão Digital',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Quicksand-VariableFont_wght',
      ),
      routes: {
        AppRoutes.LOGIN: (ctx) => LoginPage(),
        AppRoutes.CREATE_ACCOUNT: (ctx) => CreateAccPage(),
        AppRoutes.SUCCESS: (ctx) => SuccessPage(),
        AppRoutes.LOST_PASSWORD: (ctx) => LostPasswordPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Text('Missão Digital');
  }
}
