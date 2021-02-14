import 'package:flutter/material.dart';
import './myImagePicker.dart';
import './introduction_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MySwiperApp(),
        '/imagePicker': (context) => MyImagePicker(),
      },
    );
  }
}
