import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section_item.dart';
import 'package:transparent_image/transparent_image.dart';

class SectionItemTile extends StatelessWidget {
  final SectionItem sectionItem;

  const SectionItemTile({Key key, this.sectionItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => sectionItem.product.isNotEmpty
          ? Navigator.of(context)
              .pushNamed("/productSelectById", arguments: sectionItem.product)
          : {},
      child: AspectRatio(
        aspectRatio: 1,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: sectionItem.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
