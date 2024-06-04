import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/album.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/components/backButton/backButton.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:music_app/models/song.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({Key? key, required this.alb}) : super(key:key);

  final album alb;
  // final player = AssetsAudioPlayer();
  Widget build(BuildContext context) {
    print('hehe');
    print(context);

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
                child: Text(alb.albumName),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Text(alb.songs[index].songName);
                  },
                  separatorBuilder: (context, index) => Container(height: 0,),
                  itemCount: alb.songs.length),
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