import 'package:flutter/material.dart';

class RPSCustomCard2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFFF3F3F5).withOpacity(0.8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0008515, size.height * 0.1580600);
    path_0.quadraticBezierTo(size.width * 0.0030891, size.height * -0.0039600,
        size.width * 0.1658614, size.height * -0.0068000);
    path_0.quadraticBezierTo(size.width * 0.3324554, size.height * -0.0076000,
        size.width * 0.8323168, size.height * -0.0101000);
    path_0.quadraticBezierTo(size.width * 0.9991287, size.height * -0.0066800,
        size.width * 0.9989307, size.height * 0.1682400);
    path_0.cubicTo(
        size.width * 0.9989307,
        size.height * 0.3347800,
        size.width * 0.9989307,
        size.height * 0.6680000,
        size.width * 0.9989307,
        size.height * 0.8345800);
    path_0.quadraticBezierTo(size.width * 0.9991287, size.height * 1.0029600,
        size.width * 0.8323168, size.height * 1.0029400);
    path_0.lineTo(size.width * 0.3324554, size.height * 0.9995800);
    path_0.quadraticBezierTo(size.width * 0.2671287, size.height * 0.7153000,
        size.width * 0.0025545, size.height * 0.6663800);
    path_0.quadraticBezierTo(size.width * 0.0016832, size.height * 0.5392800,
        size.width * -0.0008515, size.height * 0.1580600);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
