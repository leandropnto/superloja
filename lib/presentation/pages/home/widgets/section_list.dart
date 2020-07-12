import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/widgets/section_header.dart';
import 'package:superloja/presentation/pages/home/widgets/section_list_item_tile.dart';

class SectionList extends StatelessWidget {
  final Section section;

  const SectionList({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final reversed = section.items.reversed.toList();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(
            section: section,
          ),
          SizedBox(height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => SectionListItemTile(sectionItem: reversed[index],),
                separatorBuilder: (_, __) => const SizedBox(width: 4,),
                itemCount:  section.items.length
            ), ),
        ],
      ),
    );
  }
}
