import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mission/firebase_options.dart';
import 'package:mission/pages/email_login_page.dart';
import 'package:mission/pages/start/home_page.dart';
import 'package:mission/pages/login_page.dart';
import 'package:mission/pages/lost_password.dart';
import 'package:mission/pages/reset_password_page.dart';
import 'package:mission/pages/successful.dart';
import 'package:mission/utils/app_routes.dart';

import 'pages/create_acc_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
        AppRoutes.login: (ctx) => const LoginPage(),
        AppRoutes.createAccount: (ctx) => const CreateAccPage(),
        AppRoutes.success: (ctx) => const SuccessPage(),
        AppRoutes.lostPassword: (ctx) => const LostPasswordPage(),
        AppRoutes.resetPassword: (ctx) => const ResetPasswordPage(),
        AppRoutes.emailLogin: (ctx) => const EmailLoginPage(),
        AppRoutes.homePage: (ctx) => const HomePage(),
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
    return const Text('Missão Digital');
  }
}
