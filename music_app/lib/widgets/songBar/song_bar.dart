import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/songDetail/song_detail_page.dart';
import 'package:music_app/screens/songDetail/widgets/play_pause_button.dart';
import 'package:provider/provider.dart';

class SongBar extends StatefulWidget {
  const SongBar({super.key});

  @override
  State<SongBar> createState() => _SongBarState();
}

class _SongBarState extends State<SongBar> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Hero(
      tag: 'songBar',
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Material(
            color: Colors.black.withOpacity(0),
            child: InkWell(
              onTap: () => {
                // Song song = context.watch<SongProvider>().getSong;

                print('123321'),
                print('123321'),
                // print(song);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongDetailScreen(song: context.watch<SongProvider>().getSong))
                )
              },
              child: Container(
              // width: double.infinity,
                height: 48,
                width: screenWidth * 0.96,
                decoration: BoxDecoration(
                  // color: Colors.yellow.withOpacity(0.8),
                  color: Color.fromRGBO(37, 37, 37, 0.9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1, color: Colors.white30)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   padding: EdgeInsets.zero,
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     color: Colors.white,
                    //     Icons.play_circle,
                    //     size: 32,  
                    //   )
                    // ),
                    // Hero(
                    //   tag: 'play_pause_button',
                    //   child: PlayPauseButton(musicPath: Provider.of<SongProvider>(context, listen: false).getSongPath)
                    // ),
                    PlayPauseButton(musicPath: Provider.of<SongProvider>(context, listen: false).getSongPath),
                    Expanded(
                      flex: 4,
                      child: Text(context.watch<SongProvider>().getName, style: TextStyle(color: Colors.white),)
                    ),
                    // Text(context.watch<SongProvider>().getName),
                      
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_rounded,
                        size: 24,  
                      )
                    ),
                      
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.heart_broken_outlined,
                        size: 24,  
                      )
                    ),
                    //                     Hero(
                    //   tag: 'play_pause_button',
                    //   child: PlayPauseButton(musicPath: Provider.of<SongProvider>(context, listen: false).getSongPath)
                    // ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}