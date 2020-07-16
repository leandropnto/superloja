import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/view_model/section_view.dart';
import 'package:superloja/presentation/pages/home/widgets/section_add_section.dart';
import 'package:superloja/presentation/pages/home/widgets/section_staggered.dart';

import 'section_list.dart';

class SectionProducts extends StatelessWidget {
  final List<SectionView> sections;
  final bool isEditting;

  const SectionProducts({Key key, this.sections, this.isEditting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = sections.map<Widget>((section) {
      switch (section.type) {
        case 'List':
          return SectionList(
            key: ObjectKey(section),
            section: section,
          );
        case 'Staggered':
          return SectionStaggered(
            key: ObjectKey(section),
            section: section,
          );
        default:
          return Container();
      }
    }).toList();

    if (isEditting) {
      children.add(SectionAddSection());
    }
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
