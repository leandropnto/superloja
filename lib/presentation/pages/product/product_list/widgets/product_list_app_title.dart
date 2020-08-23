import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';

import 'search_dialog.dart';

class ProductListAppTitle extends StatelessWidget {
  final ProductBloc bloc = ProductBloc.to;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => GestureDetector(
        onTap: () async {
          final search = await showDialog<String>(
              context: context,
              builder: (_) => SearchDialog(search: bloc.filter.value));
          if (search != null) {
            bloc.filterBy(search);
          }
        },
        child: Container(
          width: constraints.biggest.width,
          child: Obx(
            () => Text(
              bloc.filter.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
