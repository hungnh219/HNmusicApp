import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/components/album/album.dart';

class MusicList extends StatelessWidget {
  MusicList({Key? key, required this.title, required this.albumList}) : super(key: key);

  final String title;
  final List<StatelessWidget> albumList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsets.only(left: 0),  
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),  
          )
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                child: albumList[index]
              );
            },
            separatorBuilder: (context, index) => Container(height: 0),
          ),
        ),
      ],),
    );
  }
}