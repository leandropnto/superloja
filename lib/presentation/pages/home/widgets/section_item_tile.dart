import 'dart:io';

import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/home/view_model/section_item_view.dart';
import 'package:transparent_image/transparent_image.dart';

class SectionItemTile extends StatelessWidget {
  final SectionItemView sectionItem;

  const SectionItemTile({Key key, this.sectionItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ObjectKey(sectionItem),
      onTap: () => sectionItem.product.isNotEmpty
          ? Navigator.of(context)
              .pushNamed("/productSelectById", arguments: sectionItem.product)
          : {},
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: sectionItem.image is String? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: sectionItem.image as String,
            fit: BoxFit.cover,
          ) : Image.file(sectionItem.image as File, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
