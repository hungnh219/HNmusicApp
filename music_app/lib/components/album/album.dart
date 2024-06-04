import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/album.dart';

import 'package:music_app/screens/playlist/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/album.dart';

class Album extends StatelessWidget {
  const Album({Key? key, required this.alb}) : super(key: key);

  final album alb;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: BlurImage(imagePath: alb.albumImage),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1)
            ),
            child: Image.asset(
            alb.albumImage,
            width: 120,
            height: 120,
            fit: BoxFit.fitHeight,
            ),
          ),

        ]
      ),
      Padding(
        padding: EdgeInsets.only(left: 0),
        child: Text(
          alb.albumName.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ),
    ],),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistScreen(alb: alb))
        );
      },
    );
  }
}

class BlurImage extends StatelessWidget {
  BlurImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover
        )
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            child: Text('test'),
          ),
          ),),
    );
  }
}
