import 'package:flutter/material.dart';
import 'package:music_app/my_color.dart';
import 'package:music_app/my_string.dart';
import 'package:music_app/song.dart';
import 'package:music_app/components/header/header.dart';
import 'package:music_app/components/footer/footer.dart';
import 'package:music_app/screens/home/home.dart';
import 'package:music_app/screens/library/library.dart';

import 'package:music_app/data/music/music.dart' as music_data;

void main() {
  var mySong = new music_data.Music('o quy', null, 'hung dep trai vcl may con ga biet gi', 'hehe');
  // final player = AudioPlayer();
  print(mySong.name);
  // const String url = '../audio/o-quy.wav';
  // player.play(DeviceFileSource('package:music_app/audio/o-quy.wav'));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
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
              const header(titleApp: 'Thời khóa biểu 1'),
              Expanded(
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
                child: HomeScreen(),
              ),
              footer(),
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

