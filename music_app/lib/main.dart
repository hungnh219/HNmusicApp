import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/screens/login/login_page.dart';
import 'package:music_app/screens/songDetail/song_detail_page.dart';
import 'package:music_app/utils/theme/my_color.dart';
import 'package:music_app/utils/theme/my_string.dart';
import 'package:music_app/widgets/album/album.dart';
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
      home: LoginScreen(),
    ),
  ));
}

class SongProvider extends ChangeNotifier {
  var audioPlayer = AudioPlayer();
  List<Song> _playList = den_vau_list;

  Song _song = o_quy;

  bool _isPlay = false;
  
  String get getName => _song.songName;

  Song get getSong => _song;

  String get getSongPath => _song.audioPath;
  
  bool get isPlay => _isPlay;

  List<Song> get getPlayList => _playList;

  SongProvider() {
    audioPlayer.onPlayerComplete.listen((event) {
      nextSong();
    });
  }

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

  void changePlayList(List<Song> newPlayList) {
    this._playList = newPlayList;
    notifyListeners();
  }

  void randomSong() {
    Random random = new Random();
    int randomNumber = random.nextInt(_playList.length);
    changeSong(_playList[randomNumber]);
  }

  int checkSong() {
    for (int i = 0; i < _playList.length; i++) {
      if (_playList[i] == _song) {
        return i;
      }
    }

    return -1;
  }

  void nextSong() {
    int songIndex = checkSong();

    if (songIndex == -1) {
      changeSong(_playList[0]);
      return;
    }
    if (songIndex + 1 == _playList.length) {
      changeSong(_playList[0]);
    } else {
      changeSong(_playList[songIndex + 1]);
    }
  }

  void prevSong() {
    int songIndex = checkSong();

    if (songIndex == -1) {
      changeSong(_playList[0]);
      return;
    }

    if (songIndex == 0) {
      changeSong(_playList[_playList.length - 1]);
    } else {
      changeSong(_playList[songIndex - 1]);
    }
  }
}

