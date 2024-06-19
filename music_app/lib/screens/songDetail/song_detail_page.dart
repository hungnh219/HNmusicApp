import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_app/widgets/backButton/back_button.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/songDetail/widgets/play_pause_button.dart';

class SongDetailScreen extends StatelessWidget {
  SongDetailScreen({Key? key, required this.song}) : super(key: key);

  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playMusic(musicPath) async {
    await audioPlayer.play(AssetSource(musicPath));
  }

  Future<void> stopMusic() async {
    await audioPlayer.pause();
  }

  final Song song;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: Container(
        //   width: double.infinity,
        //   color: Colors.red,
        //   child: Row(
        //     children: [
        //       Text('floating action button'),
        //       // BackButton()
        //     ],
        //   )
        // ),
        body: Stack(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(song.image),
            //       fit: BoxFit.fitHeight
            //     )
            //   ),
            //   child: null,
            // ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: BackButton(),
                      ),

                      Expanded(
                        flex: 4,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(song.songName),
                            Text(song.artistName),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert)
                        ),
                      ),
                    ],
                  ),
                  // Text(song.songName + ' [' + song.artistName + ']'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back)
                      ),

                      // IconButton(
                      //   onPressed: () {
                      //     playMusic(song.audioPath);
                      //   },
                      //   icon: Icon(Icons.play_circle)
                      // ),

                      // IconButton(
                      //   onPressed: () {
                      //     stopMusic();
                      //   },
                      //   icon: Icon(Icons.pause_circle)
                      // ),
                      PlayPauseButton(musicPath: song.audioPath),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward)
                      ),
                    ],
                  ),
                  
                  // PlayPauseButton(musicPath: song.audioPath),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.heart_broken)
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.loop)
                      ),

                      // PlayPauseButton(musicPath: song.audioPath),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.album)
                      ),
                    ],
                  ),
                  // Hero(tag: 'songBar', child: Text('check'))
                ],
              ),
            ),
          ]
        )
      ) 
    );
  }
}