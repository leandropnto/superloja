import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductImages extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AspectRatio(
        aspectRatio: 1,
        child: Carousel(
          dotBgColor: Colors.transparent,
          autoplay: false,
          dotColor: kPrimaryColor,
          dotIncreasedColor: kPrimaryColor,
          dotSpacing: 20,
          dotSize: 5,
          defaultImage: const Center(
            child: Text(
              'Carregando...',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
          ),
//              defaultImage: SvgPicture.asset("assets/svg/cart.svg"),
          images: bloc.product.value.images
              .map((i) => Image.network(i as String))
              .toList(),
        ),
      ),
    );
  }
}
