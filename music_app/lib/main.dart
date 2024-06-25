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
import 'package:music_app/models/provider.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //   create: (_) => SongProvider(),
  //   child: MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: HomeScreen(),
  //   ),
  // ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SongProvider()),
      ChangeNotifierProvider(create: (context) => FooterProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )
    )
  );

  // runApp(MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: HomeScreen(),
  //   )
  // );
}
