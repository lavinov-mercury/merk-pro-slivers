import 'package:flutter/material.dart';

class FancyStuffScreen extends StatelessWidget {
  const FancyStuffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            title: const Text('Fancy Stuff'),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'racoon.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: 10,
            ),
          ),
          SliverOpacity(
            opacity: 0.8,
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ColoredBox(
                color: Colors.primaries[index % Colors.primaries.length],
                child: ListTile(
                  title: Text('${index + 1}'),
                ),
              ),
              childCount: 3 * 5,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: 5,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: 5,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: 5,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 128),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${index + 1}')),
              childCount: 10,
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

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const ColoredBox(
      color: Colors.pinkAccent,
      child: Center(
        child: Text('Hey there'),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
