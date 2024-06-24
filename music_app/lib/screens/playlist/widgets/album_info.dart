import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/album.dart';

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({super.key, required this.alb});

  final album alb;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              alb.albumImage,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Text(
              alb.albumName,
              style: TextStyle(
                color: Colors.white, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}