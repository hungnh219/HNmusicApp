import 'package:flutter/material.dart';
import 'package:music_app/my_color.dart';
import 'package:music_app/my_string.dart';
import 'package:music_app/song.dart';

void main() {
  Song newSong = Song(1, '2134');
  newSong.name = '123';

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text(
              app_name,
              style: TextStyle(
                backgroundColor: Colors.red,
              ),
              ),
            const Text('hehe'),
            Container(
              // color: Colors.red,
              color: Color(background_color_rgb),
              child: const Row(children: [
                Text('login'),
                Text('sign up'),
              ],),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text('login'),
              Text('sign up'),
            ],),
            lesson(),
          ],
        ),
      )
    ),
  ));
}

// stateless widget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class lesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('anh hung nghe vcl',
          ),
          Container(
            height: 4,
            color: Color(background_color_rgb),
          ),
          Text('may con ga biet hehe'),
        ],
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
