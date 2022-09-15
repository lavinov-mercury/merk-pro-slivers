import 'package:flutter/material.dart';
import 'package:sliver_demo/src/sliver_tools_demo_list.dart';

import 'sticky_headers_list.dart';

class NestedScrollViewExampleScreen extends StatelessWidget {
  const NestedScrollViewExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                stretch: true,
                title: const Text('NestedScrollView & Libs'),
                backgroundColor: Colors.pink,
                flexibleSpace: FlexibleSpaceBar(
                  background: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                    ),
                    child: Image.asset(
                      'racoon.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Sticky Header'),
                    Tab(text: 'SliverTools'),
                  ],
                ),
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              StickyHeadersList(),
              SliverToolsDemoList(),
            ],
          ),
        ),
      ),
    );
  }
}
