import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Movie moves",textAlign: TextAlign.center,),
      // actions: <Widget>[
      //   IconButton(icon: const Icon(Icons.access_alarm_sharp),onPressed: (){debugPrint("appbar");},)
      // ],
      
    );
  }
}