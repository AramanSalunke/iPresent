import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgres extends StatelessWidget {
  final double? value;
  CircularProgres({this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularBar(
          offset: Offset(MediaQuery.of(context).size.width * 0.103,
              MediaQuery.of(context).size.height * 0.0478),
          endAngle: (pi * 2 * value!),
          radius: MediaQuery.of(context).size.height * 0.048),
    );
  }
}

class CircularBar extends CustomPainter {
  Offset? offset = Offset(0, 0);
  double? radius = 40.0;
  double? endAngle = (pi * 2 * 0.5);

  CircularBar({this.offset, this.radius, this.endAngle});
  @override
  void paint(Canvas canvas, Size size) {
    var p = Paint()
      ..color = Colors.blue[900]!
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: offset!, radius: radius!), -pi / 2,
        endAngle!, false, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
