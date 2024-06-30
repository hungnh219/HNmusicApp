import 'package:flutter/material.dart';
import 'package:music_app/models/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';


class TimeCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerProvider = context.watch<TimerProvider>();
    int totalSeconds = (1500 * timerProvider.percent).round();
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    TextStyle t1 = const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.bold,
      fontSize: 50,
    );

    return Column(
      children: [
        CircularPercentIndicator(
          radius: 300,
          lineWidth: 30,
          percent: timerProvider.percent,
          circularStrokeCap: CircularStrokeCap.butt,
          progressColor: Color.fromARGB(179, 204, 108, 236),
          backgroundColor: Color.fromARGB(255, 44, 41, 44),
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                minutes.toString().padLeft(2, '0'),
                style: t1,
              ),
              SizedBox(width: 4),
              Text(":", style: t1),
              SizedBox(width: 4),
              Text(
                seconds.toString().padLeft(2, '0'),
                style: t1,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (timerProvider.percent > 0) {
                    if (!timerProvider.isRunning) {
                      timerProvider.startTimer(1500);
                    } else {
                      timerProvider.stopTimer();
                    }
                  }
                },
                child: Text(timerProvider.isRunning ? 'Stop' : 'Start'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  timerProvider.resetTimer();
                },
                child: Text('Restart'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
