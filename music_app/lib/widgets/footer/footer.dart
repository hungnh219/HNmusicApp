import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:music_app/screens/login/login_page.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/pomodoro/pomodoro_page.dart';
import 'package:music_app/screens/search/search_page.dart';
import 'package:music_app/screens/library/library_page.dart';

class footer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.grey,
      child: Row(
        children: [
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.home)
        // ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen())
              );
            },
            child: const Column(children: [
              Icon(Icons.home, color: Colors.white),
              Text(
                'Home',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen())
              );
            },
            child: const Column(children: [
              Icon(Icons.search, color: Colors.white),
              Text(
                'Search',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LibraryScreen())  
              );
            },
            child: const Column(children: [
              Icon(Icons.library_add, color: Colors.white),
              Text(
                'Library',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PomodoroScreen())  
              );
            },
            child: const Column(children: [
              Icon(Icons.alarm, color: Colors.white),
              Text(
                'Pomo',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
             ],
            ),
          ),
        ),
      ],)
    );
  }
}
