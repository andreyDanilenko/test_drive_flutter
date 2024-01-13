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
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: 40,
        separatorBuilder: (context, index) => (const Divider()),
        itemBuilder: (context, i) => ListTile(
          key: Key('$i'),
          leading: SvgPicture.asset(
            'assets/images/svg/grooming_fish.svg',
            height: 25,
            width: 25,
          ),
          title: Text('Item', style: theme.textTheme.bodyMedium),
          subtitle: Text('subItem', style: theme.textTheme.bodySmall),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }
}
