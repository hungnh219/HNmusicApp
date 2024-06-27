
import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/album.dart';

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

  void randomSong(List<Song> playList) {
    if (_playList != playList) {
      changePlayList(playList);
    }
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

class FooterProvider extends ChangeNotifier {
  List<bool> _screenClicked = [false, false, false, false];
  int _screen = 0;

  FooterProvider () {
    this._screenClicked[_screen] = true; 
  }

  bool get isHomeScreen => _screenClicked[0];
  bool get isSearchScreen => _screenClicked[1];
  bool get isLibraryScreen => _screenClicked[2];
  bool get isPomodoroScreen => _screenClicked[3];

  void ChangeScreen(int screenIndex) {
    for (int i = 0; i < _screenClicked.length; i++) {
      _screenClicked[i] = false;
    }

    this._screenClicked[screenIndex] = true;

    notifyListeners();
  }
}

class TimerProvider with ChangeNotifier {
  double percent = 1.0;
  Timer? _timer;
  bool isRunning = false;

  void startTimer(int totalTime) {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (percent > 0) {
        percent = roundToDecimals(percent - 1 / totalTime, 4);
        notifyListeners();
      } else {
        timer.cancel();
        _timer = null;
      }
    });

    isRunning = true;
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    percent = 1.0;
    stopTimer();
  }

  double roundToDecimals(double value, int decimals) {
    int fac = pow(10, decimals).toInt();
    return (value * fac).round() / fac;
  }
}
