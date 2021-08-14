import 'dart:ui';
import 'package:movie_moves/widgets/login.dart';
import 'package:movie_moves/widgets/signup.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  Color left = Colors.white;
  Color right = Colors.black;
  Color leftButton = Colors.red[900];
  Color rightButton;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

//TODO: Apply snackbar to show when invalid data is entered

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
              colors: [
                Colors.red[700],
                Colors.red[900]
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Text(
                  "Movie \tMoves",
                  style: TextStyle(
                    fontSize: scrsz.height * 0.075,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 7.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 45.0),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      primary: left,
                                      backgroundColor: leftButton,
                                    ),
                                    onPressed: _onLogInButtonPress,
                                    child: const Text(
                                      "LOG IN",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      backgroundColor: rightButton,
                                      primary: right,
                                    ),
                                    onPressed: _onSignUpButtonPress,
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: scrsz.height * 0.55,
                        width: scrsz.width * 0.8,
                        child: Center(
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) => _onPageChanged(index),
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: const BoxConstraints.expand(),
                                child: const LoginScreen(),
                                // child: const SizedBox(height: 100.0,),
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints.expand(),
                                child: const SignUpScreen(),
                                // child: const SizedBox(height: 100.0,),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  /// Handle Page Changes
  void _onPageChanged(int index) {
    if (index == 0) {
      setState(() {
        right = Colors.black;
        left = Colors.white;
        leftButton = Colors.red[900];
        rightButton = Colors.transparent;
      });
    } else if (index == 1) {
      setState(() {
        right = Colors.white;
        left = Colors.black;
        leftButton = Colors.transparent;
        rightButton = Colors.red[900];
      });
    }
  }

  /// Handle Click in Login In button
  void _onLogInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  /// Handle Click on Sign up button
  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
