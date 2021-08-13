import 'package:flutter/material.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var tabindex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.grey,
       onTap: (int index){
         setState(() {
           tabindex=index;
         });
      },
      currentIndex: tabindex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.label),label: "Title"),
        BottomNavigationBarItem(icon: Icon(Icons.subscriptions),label: "Title"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Title"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Title"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Title"),
      ],
    );
  }
}