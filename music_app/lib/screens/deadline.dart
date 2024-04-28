import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/headerApp.dart';
import '../components/footerApp.dart';

class DeadlineScreen extends StatelessWidget {
  const DeadlineScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              headerApp(titleApp: 'Deadlines'),
              Expanded(
                child: Text('IS208.O23'),
              ),
              footerApp(),
            ],
          ),
        ),
      ),
    );
  }
}

class TestDeadlineScreen extends StatelessWidget {
  const TestDeadlineScreen({Key? key}) : super(key:key);

  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: DeadlineScreen()
      )
    );
  }
}