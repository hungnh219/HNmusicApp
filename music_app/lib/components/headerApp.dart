import 'package:flutter/material.dart';
import '../my_color.dart';

class headerApp extends StatelessWidget {

  const headerApp({Key? key, required this.titleApp}) : super(key: key);
  final String titleApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      color: const Color(header_color),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              titleApp.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child:
                IconButton(
                  onPressed: () {
                    print('hung dep trai vcl may con ga biet gi');
                  },
                  icon: Icon(Icons.alarm, color: Colors.white,))
              )
          ),
        ]
      ),
    );
  }
}

class headerColumn extends StatelessWidget{
  final List<String> titles = ['hung'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: titles.map((title) {
        return Expanded(
          child: headerApp(titleApp: title),
        );
      }).toList()
    );
  }

}