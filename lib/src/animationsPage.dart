import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  @override
  _AnimationsPageState createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation, transformationAnim;

  @override
  void initState() {
    super.initState();
    setState(() {
      _animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 5));
    });
    _animation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationPage'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: Transform.scale(
              scale: _animation.value,
              child: Center(child: Text('Ceci est un test')),
            ),
          );

        }
      ),
    );
  }
}
