import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/search_dialog.dart';

class SearchButton extends StatelessWidget {
  final ProductBloc bloc = ProductBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => bloc.filter.value.isEmpty || bloc.filter.value == "Produtos"
          ? IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                final search = await showDialog<String>(
                    context: context, builder: (_) => const SearchDialog());
                if (search != null) {
                  bloc.filterBy(search);
                }
              },
            )
          : IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                bloc.filterBy("Produtos");
              },
            ),
    );
  }
}
