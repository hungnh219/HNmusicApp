import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              header(titleApp: 'Deadlines'),
              Expanded(
                child: Text('IS208.O23'),
              ),
              footer(),
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
        child: SearchScreen()
      )
    );
  }
}