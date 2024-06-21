import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/main.dart';

import 'package:music_app/widgets/backButton/back_button.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/songDetail/widgets/play_pause_button.dart';
import 'package:provider/provider.dart';

class SongDetailScreen extends StatelessWidget {
  SongDetailScreen({Key? key, required this.song}) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(song.image),
                  fit: BoxFit.fitHeight
                )
              ),
              child: null,
            ),
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
                        child: BackButtonCustom(),
                      ),

                      Expanded(
                        flex: 4,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(song.songName, style: TextStyle(color: Colors.red),),
                            Text(song.artistName, style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert, color: Colors.red,)
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.red,  
                        )
                      ),

                      PlayPauseButton(musicPath: song.audioPath),
                 
                      IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.red,  
                        )
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