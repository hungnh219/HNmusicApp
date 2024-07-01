import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.song});

  final Song song;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        child: Row(
          children: [
            Image.asset(
              song.image,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text(
              song.songName,
              style: TextStyle(
                color: Colors.white 
              ),
            )
          ],
        ),
      ),
    );
  }
}