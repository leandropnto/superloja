import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/image_source_sheet.dart';

class SectionAddTitleWidget extends StatelessWidget {
  final Section section;

  const SectionAddTitleWidget({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File file) {
//      section.addItem(SectionItemView(image: file, product: ""));
//      context.bloc<SectionBloc>().add(
//            SectionEvent.onResfreshEditting(
//              section.copyWith(items: [
//                ...section.items,
//                SectionItem(image: file, product: "")
//              ]),
//            ),
//          );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () {
          if (Platform.isAndroid) {
            showModalBottomSheet(
              context: context,
              builder: (_) => ImageSourceSheet(
                onImageSelected: onImageSelected,
              ),
            );
          } else {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => ImageSourceSheet(
                onImageSelected: onImageSelected,
              ),
            );
          }
        },
        child: Container(
          color: Colors.white.withAlpha(100),
          child: const Icon(
            FontAwesome.plus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
