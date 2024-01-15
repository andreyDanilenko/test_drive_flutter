import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 13, 200, 53)),
    textTheme: const TextTheme(
        bodySmall: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600)));
