import 'package:flutter/material.dart';
import 'package:nestingscroll/demo/parent_scroll.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentScroll(),
    );
  }
}


