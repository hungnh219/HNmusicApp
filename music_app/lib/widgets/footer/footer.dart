import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/provider.dart';

import 'package:music_app/screens/login/login_page.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/pomodoro/pomodoro_page.dart';
import 'package:music_app/screens/search/search_page.dart';
import 'package:music_app/screens/library/library_page.dart';
import 'package:provider/provider.dart';

class footer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<FooterProvider>(
      builder: (context, myFooter, child) {
        return Container(
          height: 48,
          width: double.infinity,
          // decoration: BoxDecoration(
          //   color: Colors.black87
          // ),
          child: Row(
            children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  myFooter.ChangeScreen(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                },
                child: Column(children: [
                  Icon(
                    Icons.home,
                    color: myFooter.isHomeScreen ? Colors.white : Colors.white54,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: myFooter.isHomeScreen ? Colors.white : Colors.white54,
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
                  myFooter.ChangeScreen(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen())
                  );
                },
                child: Column(children: [
                  ImageIcon(
                    AssetImage("assets/icons/search_filled_icon.png"),
                    color: myFooter.isSearchScreen ? Colors.white : Colors.white54,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: myFooter.isSearchScreen ? Colors.white : Colors.white54,
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
                  myFooter.ChangeScreen(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LibraryScreen())  
                  );
                },
                child: Column(children: [
                  Icon(
                    Icons.library_add,
                    color: myFooter.isLibraryScreen ? Colors.white : Colors.white54,
                  ),
                  Text(
                    'Library',
                    style: TextStyle(
                      color: myFooter.isLibraryScreen ? Colors.white : Colors.white54,
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
                  myFooter.ChangeScreen(3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PomodoroScreen())  
                  );
                },
                child: Column(children: [
                  // Icon(
                  //   ImageIcon('assets/icons/alarm_filled_icon.png'),
                  //   color: myFooter.isPomodoroScreen ? Colors.white : Colors.white54,
                  // ),
                  ImageIcon(
                    AssetImage("assets/icons/alarm_filled_icon.png"),
                    color: myFooter.isPomodoroScreen ? Colors.white : Colors.white54,
                  ),
                  Text(
                    'Pomo',
                    style: TextStyle(
                      color: myFooter.isPomodoroScreen ? Colors.white : Colors.white54,
                    ),
                  ),
                 ],
                ),
              ),
            ),
          ],)
        );
      }
    );
  }
}
