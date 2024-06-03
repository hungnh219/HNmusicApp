import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/components/backButton/backButton.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:music_app/models/song.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({Key? key}) : super(key:key);

  // final player = AssetsAudioPlayer();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              // header(titleApp: 'Playlist'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCustom(),
                  BackButtonCustom(),
              ],),
              ElevatedButton(
                onPressed: () {
                  playSound();
                },
                child: Text('play music - o quy')
              ),
              ElevatedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text('stop music - o quy')
              ),
              ElevatedButton(
                onPressed: () {
                  playSound1();
                },
                child: Text('play music - suyt nua thi')
              ),
              ElevatedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text('stop music - suyt nua thi')
              ),
              Expanded(
                child: Text('album'),
              ),
              footer()
            ],
          ),
        ),
      ),
    );
  }

  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playSound() async {
    String soundPath = "audios/o-quy.mp3";
    await audioPlayer.play(AssetSource(soundPath));
  }
  Future<void> playSound1() async {
    String soundPath = "audios/suyt-nua-thi.mp3";
    await audioPlayer.play(AssetSource(soundPath));
  }
  Future<void> stopSound() async {
    await audioPlayer.pause();
  }
}