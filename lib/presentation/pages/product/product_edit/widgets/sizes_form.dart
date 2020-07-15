import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';

import 'edit_item_size.dart';

class SizesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductEditBloc, ProductEditState>(
      builder: (context, state) => Column(
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
          ...state.sizes
              .map<Widget>(
                (size) => EditItemSize(
                  key: ObjectKey(size),
                  size: size,
                  description: state.description,
                  isFirst: size == state.sizes.first,
                  isLast: size == state.sizes.last,
                ),
              )
              .toList(),
          if (state.sizes.isEmpty)
            const Text(
              'Informe um tamanho',
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
