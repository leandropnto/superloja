import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/product_add_photo.dart';

class ImagesForm extends StatelessWidget {
  final List<dynamic> images;

  const ImagesForm({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      key: key,
      initialValue: [...images],
      validator: (images) =>
          images.isEmpty ? "Insira ao menos uma imagem" : null,
      onSaved: (images) => context
          .bloc<ProductEditBloc>()
          .add(ProductEditEvent.onSaveImages(images)),
      builder: (state) => Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              dotBgColor: Colors.transparent,
              autoplay: false,
              dotColor: kPrimaryColor,
              dotSpacing: 20,
              dotSize: 5,
              dotIncreaseSize: 2,
              dotIncreasedColor: kPrimaryColor,
              defaultImage: SvgPicture.asset("assets/svg/cart.svg"),
              images: state.value
                  .map<Widget>(
                    (i) => Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        if (i is String)
                          Image.network(i, fit: BoxFit.cover)
                        else
                          Image.file(i as File, fit: BoxFit.cover),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              context
                                  .bloc<ProductEditBloc>()
                                  .add(ProductEditEvent.removeImage(i));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList()
                    ..add(ProductAddPhoto()),
            ),
          ),
          if (state.value.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Insira pelo menos uma imagem',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
