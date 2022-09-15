import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'sliver_pinned_overlap_injector.dart';

class StickyHeadersList extends StatelessWidget {
  const StickyHeadersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPinnedOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
            context,
          ),
        ),
        for (int i = 0; i < 5; i++)
          SliverStickyHeader.builder(
            builder: (context, state) => Container(
              height: 56.0,
              color: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #${i + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => ListTile(
                  title: Text('${i + 1}'),
                ),
                childCount: 8,
              ),
            ),
          ),
      ],
    );
  }
}
