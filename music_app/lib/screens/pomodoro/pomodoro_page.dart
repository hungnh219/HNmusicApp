import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';
import '../login/login_page.dart';
import './widgets/timecount.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            
            children: [
              header(titleApp: 'Pomodoro'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(children: [
                     TimeCount(),
                     
                  ],),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                  
                },
                child: Text('log out') 
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}

