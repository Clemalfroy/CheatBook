import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cheatbook/src/router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
  }

  Color _getColor(int index) {
    //TODO: Find a better way than random numbers
    return Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: List.generate(routes.length - 1, (int index) {
            index += 1;
            return FadeTransition(
              opacity: _animationController,
              child: InkWell(
                onTap: () =>
                    //TODO: Change transition animation.
                    Navigator.pushNamed(context, routes.keys.toList()[index]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: _getColor(index),
                  ),
                  //TODO: Display the text in a better way
                  child: Center(
                      child: Text(
                    routes.keys.toList()[index],
                    softWrap: false,
                  )),
                ),
              ),
            );
          })),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
