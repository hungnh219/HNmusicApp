import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_app/components/backButton/backButton.dart';
import 'package:music_app/models/song.dart';

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
        body: Container(
          child: Column(
            children: [
              Text(song.songName + ' [' + song.artistName + ']'),
              ElevatedButton(
                onPressed: () {
                  playMusic(song.audioPath);
                },
                child: Text('play')
              ),
              ElevatedButton(
                onPressed: () {
                  stopMusic();
                },
                child: Text('stop')
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: BackButton()
              ),
              PlusOneButton(),
            ],
          ),
        )
      ) 
    );
  }
}

class PlusOneButton extends StatefulWidget {
  PlusOneButton({super.key});

  @override
  State<PlusOneButton> createState() => _PlusOneButtonState();
}

class _PlusOneButtonState extends State<PlusOneButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              counter++;
              print(counter);
            });
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              counter--;
              print(counter);
            });
          },
          icon: Icon(Icons.dashboard)
        ),
        Text(counter.toString())
      ],
    );
  }
}