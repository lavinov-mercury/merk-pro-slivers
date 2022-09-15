import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'sliver_pinned_overlap_injector.dart';

class SliverToolsDemoList extends StatelessWidget {
  const SliverToolsDemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPinnedOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
            context,
          ),
        ),

        // 1

        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: MultiSliver(
            children: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('${index + 1}')),
                  childCount: 3,
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
                  childCount: 3 * 2,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ],
          ),
        ),

        // 2

        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverPinnedHeader(
            child: Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              height: 56,
              child: const Text('Simple pinned header'),
            ),
          ),
        ),

        // 3

        const SliverAnimatedExpandableList(),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('${index + 1}')),
            childCount: 5,
          ),
        ),
      ],
    );
  }
}

class SliverAnimatedExpandableList extends StatefulWidget {
  const SliverAnimatedExpandableList({Key? key}) : super(key: key);

  @override
  State<SliverAnimatedExpandableList> createState() =>
      _SliverAnimatedExpandableListState();
}

class _SliverAnimatedExpandableListState
    extends State<SliverAnimatedExpandableList> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedPaintExtent(
      duration: const Duration(milliseconds: 300),
      child: SliverCrossAxisPadded(
        paddingStart: 24,
        paddingEnd: 100,
        child: SliverStack(
          children: <Widget>[
            SliverPositioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black26,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('${index + 1}'),
                  onTap: () => setState((() => expanded = !expanded)),
                ),
                childCount: expanded ? 15 : 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
