import 'package:flutter/material.dart';
import 'constant.dart';
import 'ScreenOne.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: Colors.white60),
          )),
      debugShowCheckedModeBanner: false,
      // routes: {
      // '/login':(context)=>LoginPage(),
      // },

      home: ScreenOne(),
    );
  }
}