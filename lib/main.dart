import 'package:flutter/material.dart';

import 'src/bad_screen.dart';
import 'src/basic_screen.dart';
import 'src/fancy_staff_screen.dart';
import 'src/nested_scroll_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merk PRO: Slivers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merk PRO: Slivers'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Bad Example'),
            onTap: _openBadExample,
          ),
          ListTile(
            title: const Text('Basic Example'),
            onTap: _openBasicExample,
          ),
          ListTile(
            title: const Text('Fancy Stuff'),
            onTap: _openFancyStuff,
          ),
          ListTile(
            title: const Text('NestedScrollView & Libs'),
            onTap: _openNestedScrollViewExample,
          ),
        ],
      ),
    );
  }

  void _openBadExample() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const BadExampleScreen(),
        ),
      );
  void _openBasicExample() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const BasicExampleScreen(),
        ),
      );
  void _openFancyStuff() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const FancyStuffScreen(),
        ),
      );
  void _openNestedScrollViewExample() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const NestedScrollViewExampleScreen(),
        ),
      );
}
