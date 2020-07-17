import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_item.dart';
import 'package:transparent_image/transparent_image.dart';

import 'section_product_dialog.dart';

class SectionItemTile extends StatelessWidget {
  final SectionItem sectionItem;
  final Section section;

  const SectionItemTile({Key key, this.sectionItem, this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sectionBloc = BlocProvider.of<SectionBloc>(context);
    return BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
      return GestureDetector(
        key: ObjectKey(sectionItem),
        onTap: () => sectionItem.product.isNotEmpty
            ? Navigator.of(context)
                .pushNamed("/productSelectById", arguments: sectionItem.product)
            : {},
        onLongPress: state.isEditting
            ? () {
                if (sectionItem.product.isNotEmpty) {
                  context
                      .bloc<SectionBloc>()
                      .add(SectionEvent.onUpdateProduct(sectionItem));
                }
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: sectionBloc,
                    child: SectionProductDialog(
                      sectionItem: sectionItem,
                      section: section,
                    ),
                  ),
                );
              }
            : () {},
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: sectionItem.image is String
                ? FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: sectionItem.image as String,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    sectionItem.image as File,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      );
    });
  }
}
