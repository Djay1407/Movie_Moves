import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_moves/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrsz = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
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
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 32.0,
                      backgroundImage: NetworkImage(user.photoURL),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              user.displayName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                            Text(
                              user.email,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 17.0, right: 15.0),
            //   child: ListTile(
            //     trailing: Icon(
            //       Icons.menu,
            //       color: Colors.white,
            //     ),
            //     title: Text("Menu", style: TextStyle(color: Colors.white,fontSize: 18.0)),
            //   ),
            // ),
            SizedBox(
              height: scrsz.height*0.6 ,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: Icon(
                  Icons.colorize_rounded,
                  color: Colors.white,
                ),
                title: Text("Change Theme", style: TextStyle(color: Colors.white,fontSize: 18.0)),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 15.0),
              child: ListTile(
                trailing: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text("Sign Out", style: TextStyle(color: Colors.white,fontSize: 18.0)),
                onTap: (){
                  final provider= Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
