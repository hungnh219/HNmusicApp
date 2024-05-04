class Music {
  String name;
  int? time; // chap nhan kieu null
  String singer;
  String _link;

  Music(this.name, this.time, this.singer, this._link);

  String get link => _link;

  void play() {
    print('${this.name} is played by ${this.singer}');
  }
}