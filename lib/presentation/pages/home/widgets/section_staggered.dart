import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/pages/product/product_form/product_form_page.dart';

import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  final Section section;

  const SectionStaggered({Key key, this.section}) : super(key: key);

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
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            crossAxisCount: 4,
            itemCount: section.items.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => section.items[index].product.isNotEmpty
                  ? Navigator.of(context).pushNamed("/productSelectById",
                      arguments: section.items[index].product)
                  : {},
              child: Image.network(
                section.items[index].image,
                fit: BoxFit.cover,
              ),
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
