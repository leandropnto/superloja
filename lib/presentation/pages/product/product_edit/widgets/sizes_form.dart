import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';
import 'package:superloja/presentation/pages/product/core/item_size.dart';

import 'edit_item_size.dart';

class SizesForm extends StatelessWidget {
  final List<ProductSize> sizes;

  const SizesForm({Key key, this.sizes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<List<ItemSize>>(
      key: ObjectKey(sizes),
      initialValue: sizes.map((e) => ItemSize.from(e)).toList(),
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
                onTap: () => context
                    .bloc<ProductEditBloc>()
                    .add(const ProductEditEvent.addSize()),
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
      onSaved: (items) => context.bloc<ProductEditBloc>().add(
          ProductEditEvent.onSaveSizes(items.map((e) => e.toSize()).toList())),
    );
  }
}
