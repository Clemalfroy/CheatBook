import 'package:flutter/material.dart';

class PainterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PainterPage'),
      ),
      body: CustomPaint(
        painter: FirstPainter(),
        child: Container(
          height: 500,
        ),
      ),
    );
  }
}

class FirstPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.greenAccent;
    Path curvyPath = Path()
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(
          size.width * 0.2, size.height * 0.9, size.width, size.height)
      ..lineTo(size.width, 0);
    canvas.drawPath(curvyPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
