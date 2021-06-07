import 'package:flutter/material.dart';

class RPSCustomCard1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFFF3F3F5).withOpacity(0.8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0003373, size.height * 0.1627800);
    path_0.quadraticBezierTo(size.width * -0.0020635, size.height * -0.0065000,
        size.width * 0.1634921, size.height * -0.0057600);
    path_0.cubicTo(
        size.width * 0.3304563,
        size.height * -0.0048400,
        size.width * 0.6644048,
        size.height * -0.0033000,
        size.width * 0.8314881,
        size.height * -0.0022200);
    path_0.quadraticBezierTo(size.width * 1.0017659, size.height * -0.0002400,
        size.width * 1.0018056, size.height * 0.1659800);
    path_0.quadraticBezierTo(size.width * 0.9994048, size.height * 0.5422200,
        size.width * 0.9985516, size.height * 0.6677200);
    path_0.quadraticBezierTo(size.width * 0.7540079, size.height * 0.7159000,
        size.width * 0.6644048, size.height * 1.0078000);
    path_0.lineTo(size.width * 0.1668056, size.height * 1.0046000);
    path_0.quadraticBezierTo(size.width * -0.0010516, size.height * 1.0069200,
        size.width * -0.0003373, size.height * 0.8360800);
    path_0.quadraticBezierTo(size.width * -0.0003373, size.height * 0.6677200,
        size.width * -0.0003373, size.height * 0.1627800);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
