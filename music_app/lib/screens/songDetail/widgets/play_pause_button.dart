import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/song.dart';
import 'package:provider/provider.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key, required this.musicPath});

  final String musicPath;
  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  // bool isPlay = false;

  var audioPlayer = AudioPlayer();

  Future<void> playMusic(musicPath) async {
    await audioPlayer.play(AssetSource(musicPath));
  }

  Future<void> stopMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        setState(() {
          // context.watch<SongProvider>().switchPlayButton();
          Provider.of<SongProvider>(context, listen: false).switchPlayButton();
          bool isPlay = Provider.of<SongProvider>(context, listen: false).isPlay;
          // print(Provider.of<SongProvider>(context, listen: false).isPlay.toString());
          // isPlay = !isPlay;
          print(isPlay.toString());
          print((!isPlay).toString());
          print(widget.musicPath);
          isPlay ? playMusic(widget.musicPath) : stopMusic();
        })
      },
      icon: Provider.of<SongProvider>(context, listen: false).isPlay ? Icon(Icons.pause_circle) : Icon(Icons.play_circle)
    );
  }
}