import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class TimeCount extends StatefulWidget {
  int timeNum=1500;
  @override
  State<StatefulWidget> createState() {
    return TimeCountState();
  }
  
}
class TimeCountState extends State<TimeCount> {
  late double percent;
  late Timer timer;
  late bool isStop;
  @override
  void initState() {
    isStop=false;
    percent=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int totalSeconds = (widget.timeNum * percent).round();
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    TextStyle t1=const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      );
    return Column(
      children: [
        CircularPercentIndicator(
          radius:300,
          lineWidth: 30,
          percent: this.percent,
          circularStrokeCap: CircularStrokeCap.butt,
          progressColor: Color.fromARGB(179, 204, 108, 236),
          backgroundColor: Color.fromARGB(255, 44, 41, 44),
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(minutes.toString().padLeft(2, '0'),
              style: t1,
              ),

              SizedBox(width: 4),

              Text(":",style: t1),

              SizedBox(width: 4),

              Text(seconds.toString().padLeft(2, '0'),
              style: t1,
              ),
            ],
          )
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  handleButton();
                },
                child: Text(renameButton())
              ),

              Spacer(),

              ElevatedButton(
                onPressed: () {
                restartTimer();
                setState(() {
                  isStop=false;
                });
                },
                child: Text('Restart')
              ),
            ],
          ),
        ),
      ],
    );
  }
  String renameButton() {
    if(percent==1) {
      return "Start";
    }
    if(percent==0) {
      return "Done";
    }
    if(isStop) {
      return "Continue";
    }else {
      return "Stop";
    }
  }


  void startTimer() { 
   
    timer=new Timer.periodic(new Duration(seconds: 1), (Timer timer1) {
      if(percent!=0) {
        setState(() {
        percent=roundToDecimals(percent-1/1500, 4);
        });
      } else {
        timer1.cancel();
      }
      });
    
  }
  void handleButton() {
    if(percent!=0) {
      if(percent==1) {
        startTimer();
        setState(() {
          isStop=false;
      });
      } else if(!isStop) {
        stopTimer();
        setState(() {
          isStop=true;
        });
      } else {
        startTimer();
        setState(() {
          isStop=false;
        });
      }
      }
  }
  void stopTimer() {
    timer.cancel();
    }
  void restartTimer() {
    setState(() {
      percent=1;
    });
    timer.cancel();
  }
double roundToDecimals(double value, int decimals) {
  int fac = pow(10, decimals).toInt();
  return (value * fac).round() / fac;
}
}
