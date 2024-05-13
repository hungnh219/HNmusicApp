import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:music_app/screens/playlist/playlist.dart';

class Album extends StatelessWidget {
  const Album({Key? key, required this.title}) : super(key: key) ;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Image.asset(
        'assets/images/avt2.png',
        width: 120,
        height: 120,
        fit: BoxFit.fitHeight,
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ),
    ],),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistScreen())
        );
      },
    );
  }
}
