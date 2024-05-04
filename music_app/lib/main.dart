import 'package:flutter/material.dart';
import 'package:music_app/my_color.dart';
import 'package:music_app/my_string.dart';
import 'package:music_app/song.dart';
import 'package:music_app/components/headerApp.dart';
import 'package:music_app/components/footerApp.dart';
import 'package:music_app/screens/schedule.dart';
import 'package:music_app/screens/deadline.dart';
import 'package:music_app/screens/profile/profile.dart';
import 'package:music_app/screens/loginscreen.darT';

// import 'package:audioplayers/audioplayers.dart';

void main() {
  // final player = AudioPlayer();

  // const String url = '../audio/o-quy.wav';
  // player.play(DeviceFileSource('package:music_app/audio/o-quy.wav'));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: SafeArea(
    //   child: mainApp()
    // ),
    home: ScheduleScreen(),
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => const ScheduleScreen(),
      '/b': (BuildContext context) => const ProfileScreen(),
      '/c': (BuildContext context) => const DeadlineScreen(),
      '/d': (BuildContext context) => const Login(),
    },
    initialRoute: '/d',
  ));
}

class mainApp extends StatelessWidget {
  Widget build (BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          // height: 200,
          height: double.infinity,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const headerApp(titleApp: 'Thời khóa biểu 1'),
              const Expanded(
                // child: Container(
                //   color: Colors.red,
                //   width: double.infinity,
                //   // height: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/a');
                //     },
                //     child: Text('click me'),
                //     ),
                // ),
                child: ScheduleScreen(),
              ),
              footerApp(),
              // headerColumn(),
            ],
          ),
        ),
      );
  }
}

// stateful widget
class MyStateFullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidget2();
  }
}

class MyWidget2 extends State<MyStateFullWidget> {
  @override
  Widget build(BuildContext context){
    return const Text('huhu', textAlign: TextAlign.right,);
  }
}
