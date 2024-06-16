import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/screens/playlist/playlist_page.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              header(titleApp: 'Library'),
              Expanded(
                child: Text('IS208.O23'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => PlaylistScreen())
                  // );
                },
                child: Text('chill chill')),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}