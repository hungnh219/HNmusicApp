import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation<String?> _colorAnimation;
  bool isFlipped = false;

  double beginAnimationValue = 0.0;
  double endAnimationValue = 0.0;

  Color redColor = Colors.red;
  Color blueColor = Colors.blue;

  Color flashCardColor = Colors.red;
  String imgCard = 'assets/images/songs/vinflow.png';
  // Color flashCardColor = redColor; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),     
    );
    _animation = Tween<double>(
      begin: beginAnimationValue,
      end: endAnimationValue
    ).animate(_controller);
    // _colorAnimation = ColorTween(
    //   begin: Colors.red,
    //   end: Colors.blue,
    // ).animate(_controller);
    _colorAnimation = Tween<String>(
      begin: 'assets/images/songs/vinflow.png',
      end: 'assets/images/songs/hay-trao-cho-anh.png',
    ).animate(_controller);
    // _controller.repeat();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.forward && _controller.value >= 0.5) {
        if (imgCard != 'assets/images/songs/hay-trao-cho-anh.png') {
          setState(() {
            imgCard = 'assets/images/songs/hay-trao-cho-anh.png';
          });
        }
      } else if (_controller.status == AnimationStatus.forward && _controller.value <= 0.5) {
        if (imgCard != 'assets/images/songs/vinflow.png') {
          setState(() {
            imgCard = 'assets/images/songs/vinflow.png';
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // if (isFlipped) {
          //   _controller.reverse();
          // } else {
          //   _controller.forward();
          // }
          // double temp = beginAnimationValue;

          endAnimationValue = beginAnimationValue + pi;

          _animation = Tween<double>(
            begin: beginAnimationValue,
            end: endAnimationValue
          ).animate(_controller);

          _controller.forward(from: 0.0);
          // endAnimationValue == 0;

          beginAnimationValue = endAnimationValue % (2 * pi); // reset 
          

          print(beginAnimationValue.toString() + endAnimationValue.toString());
          print(_animation.value);
          isFlipped =  !isFlipped;
          if (isFlipped) {
            flashCardColor = blueColor;
          } else {
            flashCardColor = redColor;
          }
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              // ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: Container(
              height: 400,
              width: 240,
              color: Colors.lightBlueAccent,
              child: Image.asset(
                imgCard
              ),
            ),
          );
        }
      ),
    );
  }
}