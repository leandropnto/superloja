import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/domain/product/value_objects.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';

class EditItemSize extends StatelessWidget {
  final ProductSize size;
  final ProductDescription description;
  final bool isFirst;
  final bool isLast;

  const EditItemSize({
    Key key,
    this.size,
    this.description,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 30,
          child: TextFormField(
            initialValue: size.sizeName.value
                .fold((l) => l.maybeMap(orElse: () => ""), (r) => r),
            decoration: InputDecoration(
              labelText: 'Título',
              isDense: true,
              errorText: size.sizeName.isNotValid() ? "Inválido" : null,
            ),
            onFieldSubmitted: (value) =>
                context
                    .bloc<ProductEditBloc>()
                    .add(ProductEditEvent.onChangeSizeTitle(size, value)),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 30,
          child: TextFormField(
            initialValue: size.stock.value.fold(
                    (l) =>
                    l.maybeMap(
                        invalidNumber: (l) => l.number, orElse: () => ""),
                    (r) => r.toString()),
            decoration: InputDecoration(
              labelText: 'Estoque',
              isDense: true,
              errorText: size.stock.isNotValid() ? "Inválido" : null,
            ),
            keyboardType:
            Platform.isIOS ? TextInputType.text : TextInputType.number,
            onFieldSubmitted: (value) =>
                context
                    .bloc<ProductEditBloc>()
                    .add(ProductEditEvent.onChangeSizeStock(size, value)),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 40,
          child: TextFormField(
            initialValue: size.price.value.fold(
                    (l) =>
                    l.maybeMap(
                        invalidNumber: (l) => l.number, orElse: () => ""),
                    (r) => r.toStringAsFixed(2)),
            decoration:  InputDecoration(
                labelText: 'Preço',
                isDense: true,
                prefixText: 'R\$ ',
                errorText: size.price.isNotValid() ? "Inválido" : null),
            keyboardType: Platform.isIOS
                ? TextInputType.text
                : const TextInputType.numberWithOptions(decimal: true),
            onFieldSubmitted: (value) =>
                context
                    .bloc<ProductEditBloc>()
                    .add(ProductEditEvent.onChangeSizePrice(size, value)),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        CustomIconButton(
          iconData: FontAwesome.remove,
          color: Colors.red,
          onTap: () =>
              context
                  .bloc<ProductEditBloc>()
                  .add(ProductEditEvent.removeSize(size)),
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_up,
          color: kPrimaryColor,
          onTap: !isFirst
              ? () =>
              context
                  .bloc<ProductEditBloc>()
                  .add(ProductEditEvent.moveSize(size, -1))
              : null,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_down,
          color: kPrimaryColor,
          onTap: !isLast
              ? () =>
              context
                  .bloc<ProductEditBloc>()
                  .add(ProductEditEvent.moveSize(size, 1))
              : null,
        ),
      ],
    );
  }
}
