import 'package:flutter/material.dart';
import 'dart:math';
import 'package:clock_app/clock_face.dart';

class ClockBody extends StatelessWidget {
  ClockBody();
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: CustomPaint(
              painter: BellsAndLegsPainter(),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 5.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ClockFace(),
          ),
        ],
      ),
    );
  }
}

class BellsAndLegsPainter extends CustomPainter {
  final Paint bellPaint;
  final Paint legPaint;
  
  BellsAndLegsPainter(): bellPaint = Paint(), legPaint = Paint() {
    bellPaint.color = const Color(0xFF333333);
    bellPaint.style = PaintingStyle.fill;
    
    legPaint.color = const Color(0xFF555555);
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 10.0;
    legPaint.strokeCap = StrokeCap.round;
  }
  
  void drawBellAndLeg(radius, canvas) {
    //bell
    Path path1 = Path();
    path1.moveTo(-55.0, -radius - 5.0);
    path1.lineTo(55.0, -radius - 5.0);
    path1.quadraticBezierTo(0.0, -radius - 75.0, -55.0, -radius - 5.0);
    
    // leg
    Path path2 = Path();
    path2.addOval(Rect.fromCircle(center: Offset(0.0, -radius - 50.0), radius: 3.0));
    path2.moveTo(0.0, -radius - 50.0);
    path2.lineTo(0.0, radius + 20.0);

    //draw the bell on top on the leg
    canvas.drawPath(path2, legPaint);
    canvas.drawPath(path1, bellPaint);
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2.0;
    canvas.save();

    canvas.translate(radius, radius);

    //draw the handle
    Path path = Path();
    path.moveTo(-60.0, -radius-10);
    path.lineTo(-50.0, -radius-50);
    path.lineTo(50.0, -radius-50);
    path.lineTo(60.0, -radius-10);

    canvas.drawPath(path, legPaint);
    //draw right bell and left leg
    canvas.rotate(2 * pi / 12);
    drawBellAndLeg(radius, canvas);

    //draw left bell and right leg
    canvas.rotate(-4 * pi / 12);
    drawBellAndLeg(radius, canvas);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return false;
  }

}
