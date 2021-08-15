import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_moves/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    var scrsz = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: scrsz.height,
          width: scrsz.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/login_signup/bkg1.jpg"),
              fit: BoxFit.fill,
            ),
            gradient: LinearGradient(
              colors: [Colors.red[700], Colors.red[900]],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Center(
                  child: Text(
                    " Movie\nMoves",
                    style: TextStyle(
                      fontSize: scrsz.height * 0.07,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 7.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.white70,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                          top: 12.0,
                        ),
                        child: SizedBox(
                          width: scrsz.width * 0.8,
                          height: 50.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Colors.red[900],
                              child: const Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: scrsz.width * 0.75,
                          height: 45.0,
                          child: Card(
                            elevation: 3.0,
                            color: Colors.white,
                            child: InkWell(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(FontAwesomeIcons.google),
                                      Text(
                                        "SIGN UP WITH GOOGLE",
                                        style: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // onTap: _registerWithGoogle,
                                onTap: () {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(
                                          context,
                                          listen: false);
                                  provider.googleLogin();
                                  // provider.user.id;
                                }),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
