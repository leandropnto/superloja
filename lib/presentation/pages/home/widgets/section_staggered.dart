import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/view_model/section_view.dart';
import 'package:superloja/presentation/pages/home/widgets/section_add_tile_widget.dart';
import 'package:superloja/presentation/pages/home/widgets/section_item_tile.dart';

import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  final SectionView section;

  const SectionStaggered({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
      return Container(
        key: ObjectKey("Stage $section"),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionHeader(
              section: section,
            ),
            StaggeredGridView.countBuilder(
              key: ObjectKey("grid${section.id}"),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: state.isEditting
                  ? section.items.length + 1
                  : section.items.length,
              itemBuilder: (context, index) => index < section.items.length
                  ? SectionItemTile(
                key: ObjectKey("$section${section.items[index]}"),
                      sectionItem: section.items[index],
                    )
                  : SectionAddTitleWidget(
                      section: section,
                    ),
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
          ],
        ),
      );
    });
  }
}
