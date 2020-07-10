import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
        condition: (old, current) => old.product != current.product,
        builder: (context, state) {
          final double height = MediaQuery.of(context).size.height;
          return AspectRatio(
            aspectRatio: 1,
//            child: Carousel(
//              dotBgColor: Colors.transparent,
//              autoplay: false,
//              dotColor: kPrimaryColor,
//              dotSpacing: 20,
//              dotSize: 5,
//              dotIncreaseSize: 2,
//              images:
//                  state.product.images.map((i) => Image.network(i)).toList(),
//            ),

            child: CarouselSlider(
              options: CarouselOptions(
                height: height,
                aspectRatio: 1,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: state.product.images
                  .map<Widget>(
                    (i) => Image.network(i, fit: BoxFit.cover, height: height),
                  )
                  .toList(),
            ),
          );
        });
  }
}
