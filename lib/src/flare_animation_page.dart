import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flareAnimationPage'),
      ),
      body: FlareActor(
        "assets/success.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "success",
      ),
    );
  }
}
