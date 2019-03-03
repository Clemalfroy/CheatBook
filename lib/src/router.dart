import 'package:flutter/material.dart';
import 'package:flutter_cheatbook/src/PainterPage.dart';
import 'package:flutter_cheatbook/src/animationsPage.dart';
import 'package:flutter_cheatbook/src/flareAnimationPage.dart';
import 'package:flutter_cheatbook/src/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => HomePage(),
  "/animationsPage": (context) => AnimationsPage(),
  "/painterPage": (context) => PainterPage(),
  "/flareAnimationPage": (context) => FlareAnimationPage(),
};
