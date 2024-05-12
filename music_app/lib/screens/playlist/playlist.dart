import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/components/backButton/backButton.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key:key);

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
              // Row(children: [
              //   BackButton(),
              //   Text('hehe')
              // ],)
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
}