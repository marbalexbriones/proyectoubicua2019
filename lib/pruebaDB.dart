import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SqFlite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}