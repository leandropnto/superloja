import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class SectionSelectProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecionar Produto"),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => state.maybeMap(
          initial: (e) => const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(kPrimaryColor),
          ),
          loadInProgress: (e) => const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(kPrimaryColor),
          ),
          loadFailure: (e) =>
              const Text("Ocorreu um erro...Por favor, tente novamente."),
          loadSuccess: (e) => ListView.builder(
              itemCount: e.products.length,
              itemBuilder: (_, index) {
                final product = e.products[index];
                return ListTile(
                  onTap: () => Navigator.of(context).pop(product),
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
                  subtitle: Text(
                    product.minPrice.price.value.fold((l) => "Inválido",
                        (r) => "R\$ ${r.toStringAsFixed(2)}"),
                    style: TextStyle(
                      color: Colors.grey[600],
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
              }),
          orElse: () => Container(),
        ),
      ),
    );
  }
}
