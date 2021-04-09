import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'ScreenOne.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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