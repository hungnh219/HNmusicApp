import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/headerApp.dart';
import '../../components/footerApp.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              headerApp(titleApp: 'Profile'),
              Expanded(
                child: Column(children: [
                  Text('profile'),
                  Image.asset('assets/images/avt2.png')
                ],),
              ),
              footerApp(),
            ],
          ),
        ),
      ),
    );
  }
}
