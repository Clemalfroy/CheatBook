import 'package:flutter/material.dart';
import 'package:flutter_cheatbook/src/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}