import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/widgets/section_add_tile_widget.dart';
import 'package:superloja/presentation/pages/home/widgets/section_item_tile.dart';

import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  final Section section;

  SectionStaggered({Key key, this.section}) : super(key: key);
  final _sectionBloc = SectionBloc.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ObjectKey("Stage $section"),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(
            section: section,
          ),
          Obx(
            () => StaggeredGridView.countBuilder(
              key: ObjectKey("grid${section.id}"),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: _sectionBloc.isEditing.value
                  ? section.items.length + 1
                  : section.items.length,
              itemBuilder: (context, index) => index < section.items.length
                  ? SectionItemTile(
                      key: ObjectKey("$section${section.items[index]}"),
                      sectionItem: section.items[index],
                      section: section,
                    )
                  : SectionAddTitleWidget(
                      section: section,
                    ),
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
          ),
        ],
      ),
    );
//    });
  }
}
