import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';

import 'package:superloja/presentation/pages/home/view_model/section_view.dart';
import 'package:superloja/presentation/pages/home/widgets/section_add_tile_widget.dart';
import 'package:superloja/presentation/pages/home/widgets/section_header.dart';
import 'package:superloja/presentation/pages/home/widgets/section_item_tile.dart';

class SectionList extends StatelessWidget {
  final SectionView section;

  const SectionList({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reversed = section.items.reversed.toList();
    return BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
      return Container(
        key: ObjectKey(state.sections),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionHeader(
              section: section,
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => index < section.items.length
                    ? SectionItemTile(
                  key: ObjectKey("SectionItem$index}"),
                        sectionItem: reversed[index],
                      )
                    : SectionAddTitleWidget(section: section,),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 4,
                ),
                itemCount: state.isEditting
                    ? section.items.length + 1
                    : section.items.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
