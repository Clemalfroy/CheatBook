import 'package:flutter/material.dart';

class PainterPage extends StatefulWidget {
  @override
  PainterPageState createState() {
    return new PainterPageState();
  }
}

class PainterPageState extends State<PainterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation _circleColor;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _circleColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PainterPage'),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _circleColor,
            builder: (context, widget) {
              return CustomPaint(
                painter: FirstPainter(_circleColor.value),
                child: Container(
                  height: 500,
                ),
              );
            },
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                'test',
                style: Theme.of(context).textTheme.display4,
              ))
        ],
      ),
    );
  }
}

class FirstPainter extends CustomPainter {
  final Color circleColor;

  FirstPainter(this.circleColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.cyan;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = Colors.greenAccent;
    Path greenPath = Path()
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(
          size.width * 0.2, size.height * 0.9, size.width, size.height)
      ..lineTo(size.width, 0);
    canvas.drawPath(greenPath, paint);
    paint.color = Colors.deepPurple;
    Path cyanPath = Path()
      ..lineTo(0, size.height)
      ..conicTo(size.width / 3, size.height / 7, size.width / 1.5, 0, 7)
      ..close();
    canvas.drawPath(cyanPath, paint);
    paint.color = circleColor;
    canvas.drawCircle(Offset(size.width / 1.5, size.height / 2), 50, paint);
  }

  @override
  bool shouldRepaint(FirstPainter oldDelegate) {
    return oldDelegate.circleColor != circleColor;
  }
}
