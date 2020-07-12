import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/widgets/section_staggered.dart';

import 'section_list.dart';

class SectionProducts extends StatelessWidget {
  final List<Section> sections;

  const SectionProducts({Key key, this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = sections.map<Widget>((section) {
      switch (section.type) {
        case 'List':
          return SectionList(
            section: section,
          );
        case 'Staggered':
          return SectionStaggered(section: section,);
        default:
          return Container();
      }
    }).toList();
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
