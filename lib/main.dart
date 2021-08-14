import 'package:flutter/material.dart';
import 'package:movie_moves/Screens/homescr.dart';
import 'package:movie_moves/Screens/login_signup.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_moves/model/model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MovieItemAdapter());
  await Hive.openBox<MovieItem>("Mybox1");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Moves',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.red,
            secondary: Colors.grey[700],
            surface: Colors.grey[700]
            ),
            primaryColor: Colors.grey[700],
            scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const HomeScreen(),
    );
  }
}
