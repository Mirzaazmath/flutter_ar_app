import 'package:flutter/material.dart';
import 'package:flutter_ar_earth/screens/ar_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArEarthScreen(),);
  }
}
