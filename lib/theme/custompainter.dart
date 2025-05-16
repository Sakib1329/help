import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help/theme/color.dart';

class NavBarPainter extends CustomPainter {
  final double dipCenter;

  NavBarPainter({required this.dipCenter});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.veryLightGray
      ..style = PaintingStyle.fill;

    Path path = Path();
    double curveWidth = 100;
    double curveHeight = 18;

    path.moveTo(0, 0);
    path.lineTo(dipCenter - curveWidth / 2 - 10, 0);

    path.quadraticBezierTo(
        dipCenter - curveWidth / 2, 0, dipCenter - curveWidth / 2 + 10, curveHeight);

    path.arcToPoint(
      Offset(dipCenter + curveWidth / 2 - 10, curveHeight),
      radius: Radius.circular(40),
      clockwise: false,
    );

    path.quadraticBezierTo(
        dipCenter + curveWidth / 2, 0, dipCenter + curveWidth / 2 + 10, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black26, 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavBarPainter oldDelegate) =>
      oldDelegate.dipCenter != dipCenter;
}