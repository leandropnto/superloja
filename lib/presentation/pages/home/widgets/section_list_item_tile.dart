import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section_item.dart';

class SectionListItemTile extends StatelessWidget {
  final SectionItem sectionItem;

  const SectionListItemTile({Key key, this.sectionItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        sectionItem.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
