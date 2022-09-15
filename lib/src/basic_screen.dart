import 'package:flutter/material.dart';

class BasicExampleScreen extends StatelessWidget {
  const BasicExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemsCount = 40;

    return Scaffold(
      appBar: AppBar(title: const Text('Basic Example')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text('Header'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: itemsCount,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text('Footer'),
            ),
          ),
        ],
      ),
    );
  }
}
