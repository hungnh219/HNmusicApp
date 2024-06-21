import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/songDetail/song_detail_page.dart';
import 'package:music_app/utils/theme/my_color.dart';
import 'package:music_app/utils/theme/my_string.dart';
import 'package:music_app/widgets/header/header.dart';
import 'package:music_app/widgets/footer/footer.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/models/song.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SongProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}

class SongProvider extends ChangeNotifier {
  var audioPlayer = AudioPlayer();

  Song _song = o_quy;

  bool _isPlay = false;
  
  String get getName => _song.songName;

  Song get getSong => _song;

  String get getSongPath => _song.audioPath;
  
  bool get isPlay => _isPlay;
  
  Future<void> playMusic() async {
    await audioPlayer.play(AssetSource(this._song.audioPath));
  }

  Future<void> pauseMusic() async {
    await audioPlayer.pause();
  }

  Future<void> replayMusic() async {
    await audioPlayer.stop();

    await playMusic();
  }

  void switchPlayButton() {
    this._isPlay = !_isPlay;
    
    _isPlay ? playMusic() : pauseMusic();

    notifyListeners();
  }

  void changeSong(Song newSong) {
    if (this._isPlay) {
      if (this._song != newSong) this._song = newSong;
    } else {
      this._isPlay = true;
      this._song = newSong;
    }

    replayMusic();
     
    notifyListeners();
  }

  void printDuration() {
    print('123');

    // audioPlayer.onDurationChanged.listen((Duration duration) {
    //   print(duration.inMilliseconds);
    // });
  }
}

