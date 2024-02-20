import 'package:core_exam/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home' : (context) => const HomeScreen(),
      },
    )
  );
}
