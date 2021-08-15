import 'package:movie_moves/Screens/hometab.dart';
import 'package:movie_moves/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text(
        "Movie moves",
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
      appBar: appbar,
      drawer: const NavDrawer(),
      body: const HomeTab(),
    );
  }
}
