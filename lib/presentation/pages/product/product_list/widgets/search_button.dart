import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/search_dialog.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(

        builder: (context, state) {
          final search = IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final search = await showDialog<String>(
                  context: context, builder: (_) => const SearchDialog());
              if (search != null) {
                BlocProvider.of<ProductBloc>(context)
                    .add(ProductEvent.productsFilterBy(search));
              }
            },
          );

          final remove = IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              BlocProvider.of<ProductBloc>(context)
                  .add(const ProductEvent.productsFilterBy(""));
            },
          );

          return state.map(initial: (_) => search, loadInProgress: (_) => search,
              loadSuccess: (_) => search, loadFailure: (_) => search , filter: (_) => remove);
        }
    );
  }
}
