// import 'package:chef_lyf/services/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form Key

  String _email = ""; // Store the email
  String _password = ""; // Store the password

  bool _obscureTextLogin = true; // Control the visibilty of password

  @override
  void initState() {
    super.initState();
  }

  ///Validate and Save the form
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /// Log in with Email and Password
  // void _validateAndLogIn() async {
  //   if (_validateAndSave()) {
  //     await Global.auth.signInWithEmailAndPassword(
  //       email: _email,
  //       password: _password,
  //     );
  //   }
  // }

  // /// Log in with Google
  // void _signInWithGoogle() async {
  //   await Global.auth.signInWithGoogle();
  // }

  // /// Log in with Facebook
  // void _signInWithFacebook() async {
  //   await Global.auth.signInWithFacebook();
  // }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size; // Screen size

    return Form(
      // key: _formKey,
      child: Column(
        // shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 15.0,
              left: 25.0,
              right: 25.0,
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 18.0,
                color: Colors.black,
              ),
              // validator: (email) => Global.validator.verifyEmail(email),
              // onSaved: (email) => _email = Global.sanitizer.sanitizeEmail(email),
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.black54,
                  size: 28.0,
                ),
                hintText: "Email Address",
                hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
          Container(
            width: _screenSize.width * 0.7,
            height: 1.0,
            // color: Colors.grey[400],
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey,
                  Colors.transparent,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: [0.0, 0.5, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 20.0,
              left: 25.0,
              right: 25.0,
            ),
            child: TextFormField(
              obscureText: _obscureTextLogin,
              style: const TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 18.0,
                color: Colors.black,
              ),
              // validator: (password) => Global.validator.verifyPassword(password),
              // onSaved: (password) => _password = password,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: const Icon(
                  Icons.lock,
                  size: 28.0,
                  color: Colors.black54,
                ),
                hintText: "Password",
                hintStyle: const TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 17.0,
                ),
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibilty,
                  child: const Icon(
                    Icons.remove_red_eye,
                    size: 20.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: SizedBox(
                width: _screenSize.width * 0.75,
                height: 45.0,
                child: Card(
                  shadowColor: Colors.red[900],
                  elevation: 3.0,
                  color: Colors.red[900],
                  child: const Center(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // onTap: _validateAndLogIn,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: _screenSize.width * 0.75,
              height: 45.0,
              child: Card(
                elevation: 3.0,
                color: Colors.white,
                child: InkWell(
                  // splashColor: Colors.red,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(FontAwesomeIcons.facebookSquare),
                        Text(
                          "LOG IN WITH FACEBOOK",
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
                  // onTap: _signInWithFacebook,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: _screenSize.width * 0.75,
              height: 45.0,
              child: Card(
                elevation: 3.0,
                color: Colors.white,
                child: InkWell(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(FontAwesomeIcons.google),
                        Text(
                          "LOG IN WITH GOOGLE",
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
                  // onTap: _signInWithGoogle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Toggle password visibility
  void _togglePasswordVisibilty() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
