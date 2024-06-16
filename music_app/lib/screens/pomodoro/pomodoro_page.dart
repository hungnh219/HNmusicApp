import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';
import '../login/login_page.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              header(titleApp: 'Profile'),
              Expanded(
                child: Column(children: [
                  Text('profile'),
                  Image.asset('assets/images/avt2.png')
                ],),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text('test new navigate')
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
