import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';
import 'package:superloja/presentation/pages/product/core/item_size.dart';

import 'edit_item_size.dart';

class SizesForm extends StatelessWidget {
  SizesForm({Key key}) : super(key: key);

  final ProductEditBloc bloc = ProductEditBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FormField<List<ItemSize>>(
        key: ObjectKey(bloc.product.value.sizes),
        initialValue:
            bloc.product.value.sizes.map((e) => ItemSize.from(e)).toList(),
        validator: (sizes) => sizes.isEmpty ? "Cadastre um tamanho" : null,
        builder: (state) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Tamanhos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomIconButton(
                  iconData: FontAwesome.plus,
                  onTap: bloc.addSize,
                )
              ],
            ),
            ...state.value
                .map<Widget>(
                  (size) => EditItemSize(
                    key: ObjectKey(size),
                    size: size,
                    isFirst: size == state.value.first,
                    isLast: size == state.value.last,
                  ),
                )
                .toList(),
            if (state.value.isEmpty)
              const Text(
                'Informe um tamanho',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        onSaved: (items) =>
            bloc.saveSizes(items.map((e) => e.toSize()).toList()),
      ),
    );
  }
}
