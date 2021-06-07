import 'package:flutter/material.dart';

class RPSCustomCard4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFFF3F3F5).withOpacity(0.8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0014000, size.height * 0.3290800);
    path_0.quadraticBezierTo(size.width * 0.2779000, size.height * 0.2786600,
        size.width * 0.3339400, size.height * -0.0062000);
    path_0.lineTo(size.width * 0.8368800, size.height * -0.0062000);
    path_0.quadraticBezierTo(size.width * 1.0072800, size.height * -0.0061000,
        size.width * 1.0045400, size.height * 0.1614200);
    path_0.cubicTo(
        size.width * 1.0045400,
        size.height * 0.3290800,
        size.width * 1.0045400,
        size.height * 0.6644200,
        size.width * 1.0045400,
        size.height * 0.8320000);
    path_0.quadraticBezierTo(size.width * 1.0045400, size.height * 0.9968600,
        size.width * 0.8368800, size.height * 0.9997000);
    path_0.lineTo(size.width * 0.1662800, size.height * 0.9963600);
    path_0.quadraticBezierTo(size.width * -0.0012000, size.height * 0.9987600,
        size.width * -0.0014000, size.height * 0.8320000);
    path_0.cubicTo(
        size.width * -0.0014000,
        size.height * 0.7063600,
        size.width * -0.0014000,
        size.height * 0.7063600,
        size.width * -0.0014000,
        size.height * 0.3290800);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
