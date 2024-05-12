import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/components/album/album.dart';
import 'package:music_app/components/musicList/musicList.dart';
import '../../components/header/header.dart';
import '../../components/footer/footer.dart';

import 'package:music_app/screens/playlist/playlist.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key:key);
  final List<StatelessWidget> recentlyPlaylist = <StatelessWidget>[Album(title: 'hehe'), Album(title: 'den vau'), Album(title: 'son tung'), Album(title: 'jack')];
  final List<StatelessWidget> likedPlaylist = <StatelessWidget>[Album(title: 'mck'), Album(title: 'wxrdie'), Album(title: 'tlinh')];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              const header(titleApp: 'Home'),
              Expanded(
                child: Column(children: [
                  MusicList(title: 'Recently Played', albumList: recentlyPlaylist),
                  MusicList(title: 'Liked', albumList: likedPlaylist),
                ],)
              ),
              footer(),
            ],
          ),
        ),
        // body: TestListView(),
      ),
    );
  }
}

// class TestPlayList extends StatelessWidget {
//   const TestPlayList({Key? key, required this.title}) : super(key: key) ;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//       Text(title.toUpperCase()),
//       Image.asset(
//         'assets/images/avt2.png',
//         width: 200,
//         height: 200,
//       )
//     ],),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const PlaylistScreen())
//         );
//       },
//     );
//   }
// }

// class TestListView extends StatelessWidget {
//   final List<String> strList = <String>['anh', 'hung', 'dep', 
//                                         'tra', 'vcl', 'may', 
//                                         'con', 'ga', 'biet', 'gi', 
//                                         'con', 'ga', 'biet', 'gi', 
//                                         'con', 'ga', 'biet', 'gi', 
//                                         'con', 'ga', 'biet', 'gi', 
//                                        ];
//   final List<StatelessWidget> testList = <StatelessWidget>[TestPlayList(title: 'hung'), TestPlayList(title: 'hehe'), TestPlayList(title: 'hehe'), TestPlayList(title: 'hehe'), TestPlayList(title: 'hehe')];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       // height: 200,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: testList.length,
//         itemBuilder: (context, index) {
//           return Container(
//             // height: 10,
//             color: Colors.red,
//             child: testList[index]
//           );
//         },
//         separatorBuilder: (context, index) => Container(height: 20),
//       ),
//     );
//   }
// }