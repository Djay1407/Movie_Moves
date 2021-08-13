import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrsz = MediaQuery.of(context).size;
    return Drawer(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[700],Colors.grey[900]],
        )),
        child: ListView(
          children: <Widget>[
            Container(
              height: scrsz.height / 5,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 32.0,
                      child:
                          const Icon(Icons.person, color: Colors.white, size: 35.0),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:const <Widget>[
                            Text(
                              "User Name",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                            Text(
                              "User ID",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            const Padding(
              padding:
                   EdgeInsets.only(left: 17.0, top: 20.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: scrsz.height / 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                title: Text("NAV_MENU", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
