import 'package:flutter/material.dart';

class RPSCustomCard3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFFF3F3F5).withOpacity(0.8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0009800, size.height * 0.1679800);
    path_0.quadraticBezierTo(size.width * -0.0006400, size.height * 0.0003000,
        size.width * 0.1651600, size.height * -0.0026600);
    path_0.cubicTo(
        size.width * 0.2905400,
        size.height * -0.0018800,
        size.width * 0.5417000,
        size.height * -0.0002600,
        size.width * 0.6671400,
        size.height * 0.0007200);
    path_0.quadraticBezierTo(size.width * 0.7236400, size.height * 0.2694200,
        size.width * 1.0014000, size.height * 0.3317800);
    path_0.lineTo(size.width * 1.0014000, size.height * 0.8340000);
    path_0.quadraticBezierTo(size.width * 1.0035800, size.height * 1.0020400,
        size.width * 0.8377800, size.height * 1.0013400);
    path_0.quadraticBezierTo(size.width * 0.6699200, size.height * 1.0013400,
        size.width * 0.1651600, size.height * 1.0013400);
    path_0.quadraticBezierTo(size.width * 0.0023000, size.height * 1.0031200,
        size.width * 0.0009800, size.height * 0.8373000);
    path_0.quadraticBezierTo(size.width * 0.0009800, size.height * 0.6698800,
        size.width * 0.0009800, size.height * 0.1679800);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
