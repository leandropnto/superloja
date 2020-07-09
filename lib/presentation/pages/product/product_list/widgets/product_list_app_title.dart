import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';

import 'search_dialog.dart';

class ProductListAppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        const defaultTitle = Text('Produtos');
        return state.map(
          initial: (_) => defaultTitle,
          loadInProgress: (_) => defaultTitle,
          loadSuccess: (_) => defaultTitle,
          loadFailure: (_) => defaultTitle,
          filter: (e) => LayoutBuilder(
            builder: (_, constraints) => GestureDetector(
              onTap: () async {
                final search = await showDialog<String>(
                    context: context,
                    builder: (_) => SearchDialog(
                          search: e.filter
                        ));
                if (search != null) {
                  BlocProvider.of<ProductBloc>(context)
                      .add(ProductEvent.productsFilterBy(search));
                }
              },
              child: Container(
                width: constraints.biggest.width,
                child: Text(
                  e.filter,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
