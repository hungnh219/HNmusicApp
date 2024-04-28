import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class footerApp extends StatelessWidget {
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
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/a');
            },
            child: Column(children: [
              Icon(Icons.schedule),
              Text('TKB'),
             ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/c');
            },
            child: Column(children: [
              Icon(Icons.alarm),
              Text('Deadline'),
             ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/b');
            },
            child: Column(children: [
              Icon(Icons.person),
              Text('Profile'),
             ],
            ),
          ),
        ),
      ],)
    );
  }
}
