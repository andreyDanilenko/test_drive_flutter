import 'package:flutter/material.dart';
import 'package:test_drive/features/post_screen/post.dart';
import 'package:test_drive/features/posts_screen/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 13, 200, 53)),
          textTheme: const TextTheme(
              bodySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600))),
      routes: {
        '/': (context) => const PostsScreen(),
        '/detail-item': (context) => const PostScreen()
      },
      // home: const ListScreen(title: 'List Screen'),
    );
  }
}

// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: theme.colorScheme.inversePrimary,
//           title: const Text('Item Page')),
//     );
//   }
// }
