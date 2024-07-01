import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/screens/library/widgets/CustomButton.dart';
import 'package:music_app/screens/playlist/playlist_page.dart';
import 'package:music_app/widgets/album/album.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';

class LibraryScreen extends StatelessWidget {

  List<album> albums = <album>[
    son_tung_album,
    den_vau_album,
    mck_album,
    wxrdie_album,
    random_album,
    bich_phuong_album
    ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(titleApp: 'Library'),

              CustomButton(title: 'Liked tracks'),

              CustomButton(title: 'Playlists'),

              CustomButton(title: 'Albums'),

              CustomButton(title: 'Following'),

              CustomButton(title: 'Your uploads'),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'ALBUMS',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(albums.length, (index) =>
                    Center(child: Album(alb: albums[index]))
                  ),
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
