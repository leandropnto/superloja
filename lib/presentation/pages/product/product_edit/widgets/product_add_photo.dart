import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/image_source_sheet.dart';

class ProductAddPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onImageSelected(File file) {
      context.bloc<ProductEditBloc>().add(ProductEditEvent.addImage(file));
    }

    return Material(
      color: kPrimaryLightColor,
      child: IconButton(
        icon: Icon(
          FontAwesome.camera,
          color: kPrimaryColor,
          size: 50,
        ),
        color: kPrimaryColor,
        iconSize: 50,
        onPressed: () {
          if (Platform.isAndroid) {
            showModalBottomSheet(
                context: context,
                builder: (_) => ImageSourceSheet(
                      onImageSelected: onImageSelected,
                    ));
          } else {
            showCupertinoModalPopup(
                context: context,
                builder: (_) => ImageSourceSheet(
                      onImageSelected: onImageSelected,
                    ));
          }
        },
      ),
    );
  }
}
