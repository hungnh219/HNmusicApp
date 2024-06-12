import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/components/album/album.dart';
import 'package:music_app/components/musicList/musicList.dart';
import 'package:music_app/components/songBar/song_bar.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/screens/playlist/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/album.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key:key);
  
  final List<StatelessWidget> recentlyPlaylist = <StatelessWidget>[Album(alb: den_vau_album), Album(alb: random_album), Album(alb: den_vau_album)];
  final List<StatelessWidget> likedPlaylist = <StatelessWidget>[Album(alb: den_vau_album), Album(alb: random_album), Album(alb: den_vau_album), Album(alb: random_album)];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              const header(titleApp: 'Home'),
              // Expanded(
              //   child: Column(children: [
              //     MusicList(title: 'Recently Played', albumList: recentlyPlaylist),
              //     MusicList(title: 'Liked', albumList: likedPlaylist),
              //   ],)
              // ),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        MusicList(title: 'Recently Played', albumList: recentlyPlaylist),
                        MusicList(title: 'Liked', albumList: likedPlaylist),
                        MusicList(title: 'Liked', albumList: likedPlaylist),
                        MusicList(title: 'Liked', albumList: likedPlaylist),
                        MusicList(title: 'Liked', albumList: likedPlaylist),
                      ],
                    ),

                    Positioned(
                      // top: 30,
                      // right: 20,
                      bottom: 10,
                      child: SongBar()
                    ),
                  ]
                ),
              ),
              // SongBar(),
              footer(),
            ],
          ),
        ),
        // body: TestListView(),
      ),
    );
  }
}
