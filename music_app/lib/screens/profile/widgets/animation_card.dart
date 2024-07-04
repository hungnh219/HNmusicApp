import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  bool isFlipped = false;

  double beginAnimationValue = 0.0;
  double endAnimationValue = 0.0;

  Color redColor = Colors.red;
  Color blueColor = Colors.blue;

  Color flashCardColor = Colors.red;
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

    // _controller.repeat();
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
              ..rotateX(_animation.value),
            child: Container(
              height: 400,
              width: 240,
              color: flashCardColor,
              child: Text('123456789'),
            ),
          );
        }
      ),
    );
  }
}