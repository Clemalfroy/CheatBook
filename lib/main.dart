import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter_cheatbook/src/app.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  return runApp(MyApp());
}
