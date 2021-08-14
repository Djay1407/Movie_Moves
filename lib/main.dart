import 'package:flutter/material.dart';
import 'package:movie_moves/Screens/homescr.dart';
import 'package:movie_moves/Screens/login_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Moves',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.red,
            secondary: Colors.grey[700],
            surface: Colors.grey[700]
            ),
            primaryColor: Colors.grey[700],
            scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const HomeScreen(),
    );
  }
}
