import 'package:flutter/material.dart';
import 'package:helloworld/screens/profileScreen.dart';
import 'package:helloworld/screens/homeScreen.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log('Load success');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const ProfileScreen(),
      }
    );
  }
}
