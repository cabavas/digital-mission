import 'package:flutter/material.dart';

void showSuccessSnackbar(BuildContext context, {required String text}) {
  showSnackbar(context, text: text, color: Colors.green);
}

void showFailureSnackbar(BuildContext context, {required String text}) {
  showSnackbar(context, text: text, color: Colors.red);
}

void showSnackbar(BuildContext context,
    {required String text, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
