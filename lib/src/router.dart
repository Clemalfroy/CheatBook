import 'package:flutter/material.dart';
import 'package:flutter_cheatbook/src/animations_page.dart';
import 'package:flutter_cheatbook/src/flare_animation_page.dart';
import 'package:flutter_cheatbook/src/home_page.dart';
import 'package:flutter_cheatbook/src/painter_page.dart';
import 'package:flutter_cheatbook/src/slivers_page.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => HomePage(),
  "/animationsPage": (context) => AnimationsPage(),
  "/painterPage": (context) => PainterPage(),
  "/flareAnimationPage": (context) => FlareAnimationPage(),
  "/sliversPage": (context) => SliversPage(),
};
