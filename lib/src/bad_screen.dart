import 'package:flutter/material.dart';

class BadExampleScreen extends StatelessWidget {
  const BadExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemsCount = 40;

    return Scaffold(
      appBar: AppBar(title: const Text('Bad Example')),
      body: ListView.builder(
        itemCount: itemsCount + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text('Header'),
            );
          }
          if (index == itemsCount + 1) {
            return Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.blue,
              child: const Text('Footer'),
            );
          }

          return ListTile(title: Text('$index'));
        },
      ),
      // body: ListView(
      //   children: [
      //     Container(
      //       height: 50,
      //       alignment: Alignment.center,
      //       color: Colors.blue,
      //       child: const Text('Header'),
      //     ),
      //     ...List.generate(
      //       itemsCount,
      //       (index) => ListTile(title: Text('${index + 1}')),
      //     ),
      //     Container(
      //       height: 50,
      //       alignment: Alignment.center,
      //       color: Colors.blue,
      //       child: const Text('Footer'),
      //     )
      //   ],
      // ),
    );
  }
}
