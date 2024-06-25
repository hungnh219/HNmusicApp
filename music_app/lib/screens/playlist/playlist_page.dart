import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/provider.dart';
import 'package:music_app/screens/playlist/widgets/album_info.dart';
import 'package:music_app/screens/playlist/widgets/custom_modal.dart';
import 'package:music_app/widgets/playPauseButton/play_pause_button.dart';
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
          color: Colors.black,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonCustom(),
              AlbumInfo(alb: alb),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomModal();
                          }
                        );
                      },
                      icon: Icon(
                        Icons.more_horiz_outlined,
                        size: 24,
                        color: Colors.white,
                      )
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<SongProvider>(context, listen: false).randomSong(alb.songs);
                      },
                      child: ImageIcon(
                        AssetImage("assets/icons/random_icon.png"),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  children: [
                    ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Provider.of<SongProvider>(context, listen: false).changeSong(alb.songs[index]),
                          Provider.of<SongProvider>(context, listen: false).changePlayList(alb.songs)
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
                                alb.songs[index].songName,
                                style: TextStyle(
                                  color: Colors.white
                                ),
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