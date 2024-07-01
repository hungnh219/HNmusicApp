import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/provider.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/search/widgets/search_item.dart';
import 'package:music_app/screens/songDetail/song_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:tiengviet/tiengviet.dart';

// import 'package:tiengviet/';


class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final myController = TextEditingController();
  
  String? searchText;

  Song? newSong;
  List<Song> recentlyPlayed = recentlyPlayedList;
  List<Song> allSongs = allSongList;
  List<Song> searchList = recentlyPlayedList;

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      searchSong(searchText);
    });  
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void searchSong(String? newSearchText) {
    if (newSearchText == null || newSearchText == "") {
      setState(() {
        searchList = <Song>[];
      });
    } else {
      setState(() {
        searchList = allSongs.where(
          (element) => TiengViet.parse(element.songName.toLowerCase()).contains(newSearchText.toLowerCase())
        ).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SongProvider>(
      builder: (context, mySong, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    searchText = text;
                  });
                },
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  // icon: Icon(Icons.search)
                ),
                style: TextStyle(
                  color: Colors.white70
                ),
              ),
            ),
            // Text(">>>$searchText<<<"),
        
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // super.dispose();
                      mySong.changeSong(searchList[index]);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SongDetailScreen(song: searchList[index]))
                      // );
                    },
                    child: SearchItem(song: searchList[index]),
                  );
                },
                separatorBuilder: (context, index) => Container(width: 1, height: 1,),
              ),
            ),
          ],
        );
      }
    );
  }
}