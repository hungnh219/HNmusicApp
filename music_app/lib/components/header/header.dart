import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../my_color.dart';

class header extends StatelessWidget {
  const header({Key? key, required this.titleApp}) : super(key: key);
  final String titleApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      // color: const Color(header_color),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color> [
            Color(0xFF874CCC),
            Color(0xFFC65BCF),
            Color(0xFFF27BBD),
          ])
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          // upgrade button
          // Align(
          //   alignment: Alignment(-0.85, 0),
          //   child: SizedBox(
          //     height: 24,
          //     child: ElevatedButton(
          //       onPressed: () {},
          //       child: Text('upgrade')
          //     )
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Text(
              titleApp,
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
                  icon: Icon(Icons.person, color: Colors.white,))
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
          child: header(titleApp: title),
        );
      }).toList()
    );
  }

}