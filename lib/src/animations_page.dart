import 'dart:math';

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
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn)));
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
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: ClipOval(
                        child: Image.network(
                            'https://cdn.intra.42.fr/users/medium_cmalfroy.jpg'),
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: _animation.value,
                    child: Center(
                        child: Text(
                      'Scaling Text',
                      style: Theme.of(context).textTheme.title,
                    )),
                  ),
                  Transform.rotate(
                    angle: _animation.value * 6.28,
                    child: Text(
                      'Rotating Text',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-_animationController.value * 20,
                        -_animationController.value * 20),
                    child: Text("Translating text"),
                  ),
                  RadialMenu(),
                ]);
          }),
    );
  }
}

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: _animationController);
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({
    Key key,
    this.controller,
  })  : scale = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeIn),
        ),
        translation = Tween<double>(begin: 0.0, end: 70.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeIn),
        ),
        rotation = Tween<double>(begin: 0.0, end: 360.0).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.0, 0.9, curve: Curves.easeIn)),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color color, IconData icon}) {
    final double rad = angle * pi / 180;

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          print('a');
        },
        child: Icon(icon),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: rotation.value * pi / 180,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildButton(0, icon: Icons.favorite, color: Colors.deepOrange),
              _buildButton(270, icon: Icons.assessment, color: Colors.blue),
              _buildButton(180, icon: Icons.title, color: Colors.green),
              Transform.scale(
                scale: scale.value - 1,
                child: FloatingActionButton(
                  heroTag: null,
                  child: Icon(Icons.close),
                  onPressed: _close,
                  backgroundColor: Colors.red,
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  heroTag: null,
                  child: Icon(Icons.open_with),
                  onPressed: _open,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
