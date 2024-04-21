import 'package:flutter/material.dart';

class footerApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/c');
        },
        child: Text('back to home'),
      ),
    );
  }
}
