import 'package:flutter/material.dart';

import 'clock_dial_painter.dart';
import 'clock_hands.dart';

class ClockFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
          ),
          child: Stack(
            children: <Widget>[
              //  dial and numbers go here
              ClockHands(),
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: CustomPaint(
                  painter: ClockDialPainter(
                    clockText: ClockText.roman,
                  ),
                ),
              ),
              //  center point
              Center(
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              //  clock hands go here
            ],
          ),
        ),
      ),
    );
  }
}
