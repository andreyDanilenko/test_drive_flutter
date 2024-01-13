import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('List Screen'),
      ),
      body: ListView.separated(
          itemCount: 40,
          separatorBuilder: (context, index) => (const Divider()),
          itemBuilder: (context, i) {
            const post = 'Post';
            const subpost = 'subpost';
            return ListTile(
              key: Key('$i'),
              leading: SvgPicture.asset(
                'assets/images/svg/grooming_fish.svg',
                height: 25,
                width: 25,
              ),
              title: Text(post, style: theme.textTheme.bodyMedium),
              subtitle: Text(subpost, style: theme.textTheme.bodySmall),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/detail-item', arguments: post);
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const ItemScreen()));
              },
            );
          }),
    );
  }
}

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? post;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print(args);
      return;
    }

    if (args is! String) {
      log('must string' as num);
      return;
    }

    post = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(post ?? '...')),
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
