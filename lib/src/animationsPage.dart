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
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
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
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Card(
                          child: Image.network(
                              'https://cdn.intra.42.fr/users/medium_cmalfroy.jpg')),
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
                ]);
          }),
    );
  }
}
