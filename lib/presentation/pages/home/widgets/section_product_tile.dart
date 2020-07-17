import 'package:flutter/material.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class SectionProductTile extends StatelessWidget {
  final Product product;

  const SectionProductTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: product.images.isNotEmpty
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: product.images.first as String,
              fit: BoxFit.cover)
          : const Text(
              "Sem imagens",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
      title: Text(
        product.name.value.fold((l) => "", (r) => r),
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
