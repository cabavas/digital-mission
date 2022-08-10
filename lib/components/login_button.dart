import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final String? image;
  final int textColor;
  final int? backgroundColor;
  final String route;

  const LoginButton({
    Key? key,
    required this.text,
    this.image,
    required this.textColor,
    this.backgroundColor,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, route),
          style: TextButton.styleFrom(
              primary: Color(textColor),
              backgroundColor: Color(backgroundColor ?? 0xff1b1e3c),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )),
          child: Text(text),
        ),
      ),
    );
  }
}
