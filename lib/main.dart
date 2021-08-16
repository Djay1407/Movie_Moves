import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_moves/Screens/homescr.dart';
import 'package:movie_moves/Screens/login_signup.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_moves/model/model.dart';
import 'package:movie_moves/provider/google_sign_in.dart';
import 'package:movie_moves/provider/theme_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MovieItemAdapter());
  await Hive.openBox<MovieItem>("watched");
  await Hive.openBox<MovieItem>("towatch");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.

  Widget returnScaffold(Widget child) {
    return Scaffold(
      body: Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: ThemeProvider(
        themes: userThemes,
        child: ThemeConsumer(
          child: Builder(builder: (themeContext)=>MaterialApp(
            title: 'Movie Moves',
            theme: ThemeProvider.themeOf(themeContext).data,
            // theme.copyWith(
            //   colorScheme: theme.colorScheme.copyWith(
            //       primary: Colors.red[900],
            //       primaryVariant: Colors.red[700],
            //       secondary: Colors.grey[900],
            //       secondaryVariant: Colors.grey[700],
            //       // surface: Colors.grey[700],
            //       ),
            //   primaryColor: Colors.white,
            //   scaffoldBackgroundColor: Colors.grey[900],
            // ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return returnScaffold(const CircularProgressIndicator());
                }
                else if(snapshot.hasData){
                  return const HomeScreen();
                }
                else if(snapshot.hasError){
                  return returnScaffold(const Text("Something went wrong."));
                }
                else{
                  return const LoginSignupScreen();
                }
              },
            ),
          ),
          ),
        ),
      ),
    );
  }
}
