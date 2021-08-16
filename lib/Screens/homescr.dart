import 'package:movie_moves/Screens/hometab.dart';
import 'package:movie_moves/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    Future<bool> _onWillPop () {
    return showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit'),
        actions: <Widget>[
           TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
           TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
    
    final appbar = AppBar(
      title: const Text(
        "Movie moves",
        textAlign: TextAlign.center,
      ),
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: appbar,
        drawer: const NavDrawer(),
        body: const HomeTab(),
      ),
    );
  }
}
