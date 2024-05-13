import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/components/backButton/backButton.dart';
import 'package:audioplayers/audioplayers.dart';

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
                child: Text('play music')
              ),
              ElevatedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text('stop music')
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
    String soundPath = "audio/o-quy.mp3";
    await audioPlayer.play(AssetSource(soundPath));
  }
  Future<void> stopSound() async {
    await audioPlayer.pause();
  }
}