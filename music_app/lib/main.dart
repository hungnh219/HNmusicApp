import 'package:flutter/material.dart';
import 'package:music_app/utils/theme/my_color.dart';
import 'package:music_app/utils/theme/my_string.dart';
import 'package:music_app/widgets/header/header.dart';
import 'package:music_app/widgets/footer/footer.dart';
import 'package:music_app/screens/home/home_page.dart';
void main() {
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

