import 'package:flutter/material.dart';
import 'package:music_app/my_color.dart';
import 'package:music_app/my_string.dart';
import 'package:music_app/song.dart';
import 'package:music_app/components/headerApp.dart';
import 'package:music_app/components/footerApp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: mainApp()
    ),
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => headerApp(titleApp: 'navigator header'),
      '/b': (BuildContext context) => footerApp(),
      '/c': (BuildContext context) => mainApp(),
    }
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
              const headerApp(titleApp: 'hung dep trai  vcl'),
              Expanded(
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  // height: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/a');
                    },
                    child: Text('click me'),
                    ),
                ),
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
