import 'package:core_exam/view/screens/cart_screen.dart';
import 'package:core_exam/view/screens/detail_screen.dart';
import 'package:core_exam/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/home',
      routes: {
        '/home' : (context) => const HomeScreen(),
        '/detail' : (context) => const DetailScreen(),
        '/cart' : (context) => const CartScreen(),
      },
    )
  );
}
