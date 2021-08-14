// import 'package:chef_lyf/models/user.dart';
// import 'package:chef_lyf/services/firestore_service.dart';
// import 'package:chef_lyf/services/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = new GlobalKey<FormState>(); // Form key

  String _username; // Store the username
  String _email; // Sttore sanitized email
  String _password; // Store the password
  String _confirmPassword; // Store the password

  bool _obscureTextSignup = true; // Control the visibility of password field

  ///Validate and Save the form
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /// Control password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  /// Add User Signed up using email and password
  /// [email], [username] and [userID] stored.
  // Future<void> _addNewUser() async {
  //   String userUID = Global.auth.getCurrentUserUID();
  //   User user = new User(emailID: _email, userName: _username, userID: userUID);
  //   await Global.firestoreService.addNewUser(user);
  // }

  /// Register with Email and Password
  ///
  /// Then, add new user to firebase
  // void _validateAndRegisterWithEmail() async {
  //   if (_validateAndSave()) {
  //     await Global.auth.registerWithEmailAndPassword(
  //       email: _email,
  //       password: _password,
  //     );
  //     await _addNewUser();
  //   }
  // }

  // TODO: Add Auth flow (username, name) for FB and Google
  // TODO: Add check for password -- confirmPassword

  // /// Register with Google
  // void _registerWithGoogle() async {
  //   await Global.auth.signInWithGoogle();
  // }

  // /// Register with Facebook
  // void _registerWithFacebook() async {
  //   await Global.auth.signInWithFacebook();
  // }

  @override
  Widget build(BuildContext context) {
    var scrsz = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                style: const TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.black54,
                    size: 25.0,
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 17.0,
                  ),
                ),
                // validator: (username) =>
                //     Global.validator.verifyUsername(username),
                onSaved: (username) => _username = username,
              ),
            ),
            Container(
              width: scrsz.width * 0.7,
              height: 1.0,
              decoration: const BoxDecoration(
                gradient:  LinearGradient(
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
                top: 5.0,
                bottom: 5.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.alternate_email,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  hintText: "Email Id",
                  hintStyle: TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 17.0,
                  ),
                ),
                // validator: (email) => Global.validator.verifyEmail(email),
                // onSaved: (email) =>
                //     _email = Global.sanitizer.sanitizeEmail(email),
              ),
            ),
            Container(
              width: scrsz.width * 0.7,
              height: 1.0,
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
                top: 5.0,
                bottom: 5.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                obscureText: _obscureTextSignup,
                style: const TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.lock,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 17.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: const Icon(
                      Icons.remove_red_eye,
                      size: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
                // validator: (password) =>
                //     Global.validator.verifyPassword(password),
                onSaved: (password) => _password = password,
              ),
            ),
            Container(
              width: scrsz.width * 0.7,
              height: 1.0,
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
                  top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
              child: TextFormField(
                obscureText: _obscureTextSignup,
                style: const TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 18.0,
                    color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.lock,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(
                    fontFamily: "WorkSansSemiBold",
                    fontSize: 17.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: const Icon(
                      Icons.remove_red_eye,
                      size: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
                // validator: (password) =>
                //     Global.validator.verifyPassword(password),
                onSaved: (password) => _confirmPassword = password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: SizedBox(
                  width: scrsz.width * 0.75,
                  height: 45.0,
                  child: Card(
                    shadowColor: Colors.red[900],
                    elevation: 3.0,
                    color: Colors.red[900],
                    child: const Center(
                      child: Text(
                        "SIGN UP",
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
                // onTap: _validateAndRegisterWithEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: scrsz.width * 0.75,
                height: 45.0,
                child: Card(
                  elevation: 3.0,
                  color: Colors.white,
                  child: InkWell(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(FontAwesomeIcons.facebookSquare),
                          Text(
                            "SIGN UP WITH FACEBOOK",
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
                    // onTap: _registerWithFacebook,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: scrsz.width * 0.75,
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
