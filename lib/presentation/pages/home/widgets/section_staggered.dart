import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/widgets/section_item_tile.dart';

import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  final Section section;

  const SectionStaggered({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(
            section: section,
          ),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 4,
            itemCount: section.items.length,
            itemBuilder: (context, index) => SectionItemTile(
              sectionItem: section.items[index],
            ),
            staggeredTileBuilder: (index) =>
                StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
        ],
      ),
    );
  }
}
