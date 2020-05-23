import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShare',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        /*primaryswatch equals to MaterialColor, it can takes many
        shades on the app*/
        primarySwatch : Colors.deepPurple,
        accentColor   : Colors.teal,
      ),
    );
  }
}
