import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/main.dart';
import 'package:music_app/widgets/songBar/song_bar.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/screens/songDetail/song_detail_page.dart';
import 'package:provider/provider.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';

import 'package:music_app/widgets/backButton/back_button.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:music_app/models/song.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({Key? key, required this.alb}) : super(key:key);

  final album alb;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCustom(),
                  IconButton(
                    onPressed: () {} ,
                    icon: Icon(Icons.change_circle_outlined) 
                  )
                ],
              ),
              // Row(
              //   children: [
              //     Image(image: )
              //   ],
              // ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Provider.of<SongProvider>(context, listen: false).changeSong(alb.songs[index])
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Image.asset(
                                  alb.songs[index].image,
                                  height: 40,
                                  width: 40,
                                ),
                              ),

                              SizedBox(width: 8),

                              Text(
                                alb.songs[index].songName
                              )
                          ],),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Container(height: 0,),
                    itemCount: alb.songs.length
                    ),

                    Positioned(
                      bottom: 10,
                      child: SongBar()
                    ),
                  ],
                ),
              ),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}