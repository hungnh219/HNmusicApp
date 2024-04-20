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
        backgroundColor: Colors.white,
        body: Container(
          height: 200,
          color: Colors.yellow,
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text('ten'),
                  ),
                  Text('Hung dz'),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text('tuoi'),
                  ),
                  Text('21'),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text('lop'),
                  ),
                  Text('cntt2021'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print('hung dep trai');
                }, 
                child: Text('contact me'),),
              TextButton(
                onPressed: () {},
                child: Text('cancel')),
            ],
          ),
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

class testMarginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.only(left: 8.0),
      child: Text('hihihehe'),
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
