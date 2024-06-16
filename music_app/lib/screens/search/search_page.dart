import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/widgets/songBar/song_bar.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              header(titleApp: 'Deadlines'),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                      ],
                    ),

                    Positioned(
                      // top: 30,
                      // right: 20,
                      bottom: 10,
                      child: SongBar()
                    ),
                  ]
                ),
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class TestDeadlineScreen extends StatelessWidget {
  const TestDeadlineScreen({Key? key}) : super(key:key);

  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SearchScreen()
      )
    );
  }
}