import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/headerApp.dart';
import '../components/footerApp.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              headerApp(titleApp: 'Thời khóa biểu'),
              Expanded(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thang 5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        )
                      ),
                      Text(
                        'HT2',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        )
                      ),
                    ],
                  ),
                ],)
              ),
              footerApp(),
            ],
          ),
        ),
      ),
    );
  }
}