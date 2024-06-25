import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/provider.dart';
import 'package:music_app/widgets/backButton/back_button.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/widgets/playPauseButton/play_pause_button.dart';
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
            Column(
              children: [
                Container(
                  height: 48,
                  // color: Colors.black26,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color> [
                        Colors.black87,
                        Colors.black38,
                        Colors.black12,
                      ]
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color> [
                        Colors.black87,
                        Colors.black38,
                        Colors.black12,
                      ]
                    ), 
                  ),
                ),
              ],
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
                            Text(
                              song.songName,
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              song.artistName,
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert, color: Colors.white,)
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<SongProvider>(context, listen: false).prevSong();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,  
                        )
                      ),

                      PlayPauseButton(musicPath: song.audioPath),
                 
                      IconButton(
                        onPressed: () {
                          Provider.of<SongProvider>(context, listen: false).nextSong();
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,  
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
                        icon: Icon(
                          Icons.heart_broken,
                          color: Colors.white,
                          )
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.loop,
                          color: Colors.white,
                          )
                      ),

                      // PlayPauseButton(musicPath: song.audioPath),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.album,
                          color: Colors.white,
                          )
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