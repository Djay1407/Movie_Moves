import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

List<AppTheme> userThemes = [
  AppTheme(
    id: "redlight",
    description: "Red Theme",
    data: ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.red[900],
            primaryVariant: Colors.red[700],
            secondary: Colors.grey[900],
            secondaryVariant: Colors.grey[700],
            // surface: Colors.grey[700],
          ),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[900],
    ),
  ),
  AppTheme(
    id: "bluelight",
    description: "BlueLight Theme",
    data: ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.blue[900],
            primaryVariant: Colors.blue[700],
            secondary: Colors.grey[900],
            secondaryVariant: Colors.grey[700],
            // surface: Colors.grey[700],
          ),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[900],
    ),
  ),
  AppTheme(
    id: "greenlight",
    description: "GreenLight Theme",
    data: ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.green,
            primaryVariant: Colors.green,
            secondary: Colors.white,
            secondaryVariant: Colors.white,
            // surface: Colors.grey[700],
          ),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
    ),
  ),
  AppTheme(
    id: "purplelight",
    description: "PurpleLight Theme",
    data: ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.purple,
            primaryVariant: Colors.purple,
            secondary: Colors.white,
            secondaryVariant: Colors.white,
            // surface: Colors.grey[700],
          ),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
    ),
  ),
];
