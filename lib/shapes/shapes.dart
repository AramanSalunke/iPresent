import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFFE7004C).withOpacity(0.9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0112571, size.height * 0.5960594);
    path_0.quadraticBezierTo(size.width * 0.8989429, size.height * 0.4581994,
        size.width * 0.7312571, size.height * 0.5927108);
    path_0.cubicTo(
        size.width * 0.6241143,
        size.height * 0.6760061,
        size.width * 0.4098286,
        size.height * 0.8425967,
        size.width * 0.3026857,
        size.height * 0.9258920);
    path_0.quadraticBezierTo(size.width * 0.1456286, size.height * 1.0396424,
        size.width * 0.5488286, size.height * 1.0289102);
    path_0.quadraticBezierTo(size.width * 0.8869429, size.height * 1.0386043,
        size.width * 1.0025714, size.height * 1.0325267);
    path_0.quadraticBezierTo(size.width * 1.0025714, size.height * 0.9303958,
        size.width * 1.0112571, size.height * 0.5960594);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color(0xFFE7004C).withOpacity(0.9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0029143, size.height * 0.5843060);
    path_1.lineTo(size.width * 0.0000571, size.height * 1.0012010);
    path_1.lineTo(size.width * 0.3908571, size.height * 0.7089224);
    path_1.quadraticBezierTo(size.width * 0.4663714, size.height * 0.6301477,
        size.width * 0.3400571, size.height * 0.5759346);
    path_1.quadraticBezierTo(size.width * 0.2550571, size.height * 0.5370076,
        size.width * 0.0000571, size.height * 0.4202268);

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
