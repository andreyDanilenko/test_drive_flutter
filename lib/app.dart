import 'package:flutter/material.dart';
import 'package:test_drive/router/router.dart';
import 'package:test_drive/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      routes: routes,
      navigatorObservers: [],
    );
  }
}
