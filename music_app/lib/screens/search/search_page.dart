import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/provider.dart';
import 'package:music_app/screens/search/widgets/search_box.dart';
import 'package:music_app/widgets/songBar/song_bar.dart';
import 'package:provider/provider.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return Consumer2<SongProvider, FooterProvider>(
      builder: (context,mySong, myFooter, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.infinity,
              color: Colors.black87,
              child: Column(
                children: [
                  // header(titleApp: 'Deadlines'),
                  Expanded(
                    child: Stack(
                      children: [
                        SearchBox(),
                  
                        Positioned(
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