import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../widgets/header/header.dart';
import '../../widgets/footer/footer.dart';
import '../login/login_page.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key:key);

  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            
            children: [
              header(titleApp: 'Pomodoro'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(children: [
                     TimeCount(),
                     
                  ],),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                },
                child: Text('log out')
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}

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
    TextStyle t1=new TextStyle(color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 50);
    return Column(
      children: [
        CircularPercentIndicator(radius:300,lineWidth: 30,percent: this.percent,
       
        circularStrokeCap: CircularStrokeCap.butt,
        progressColor: Color.fromARGB(179, 204, 108, 236),
        backgroundColor: Color.fromARGB(255, 44, 41, 44),
     
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(minutes.toString().padLeft(2, '0'),
            style: t1,
            ),
            SizedBox(width: 4,),
            Text(":",style: t1,),
            SizedBox(width: 4,),

            Text(seconds.toString().padLeft(2, '0'),style: t1,),

          ],
        )),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                               onPressed: () {
                             if(percent!=0) {
                              if(percent==1) {
                              setState(() {
                                isStop=false;
                              });
                              startTimer();
                             }else if(!isStop) {
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
                            },
                                child: Text((percent==1?"Start":percent==0?"Done":isStop?"Continue":"Stop") as String)
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
  void stopTimer() {
    timer.cancel();
    }
     void restartTimer() {
    setState(() {
      percent=1;
    });
    timer.cancel();
    startTimer();
    }
double roundToDecimals(double value, int decimals) {
  int fac = pow(10, decimals).toInt();
  return (value * fac).round() / fac;
}
}
