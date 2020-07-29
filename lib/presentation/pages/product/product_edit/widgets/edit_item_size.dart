
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/value_objects.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';
import 'package:superloja/presentation/pages/product/core/item_size.dart';

class EditItemSize extends StatelessWidget {
  final ItemSize size;
  final bool isFirst;
  final bool isLast;

  const EditItemSize({
    Key key,
    this.size,
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
            initialValue: size.title,
            decoration: const InputDecoration(
              labelText: 'Título',
              isDense: true,
            ),
            validator: (title) => SizeName(title).mapToErrorMessage("Inválido"),
            onChanged: (name) => size.title = name,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 30,
          child: TextFormField(
            initialValue: size.stock.toString(),
            decoration: const InputDecoration(
              labelText: 'Estoque',
              isDense: true,
            ),
            validator: (number) => Stock(number).mapToErrorMessage("Inválido"),
            keyboardType: TextInputType.number,
            onChanged: (stock) =>  size.stock = int.tryParse(stock),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 40,
          child: TextFormField(
            initialValue: size.price?.toStringAsFixed(2),
            decoration: const InputDecoration(
              labelText: 'Preço',
              isDense: true,
              prefixText: 'R\$ ',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (price) => Price(price).mapToErrorMessage("Inválido"),
            onChanged: (price) => size.price = num.tryParse(price),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: true),
            ],
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        CustomIconButton(
          iconData: FontAwesome.remove,
          color: Colors.red,
          onTap: () => context
              .bloc<ProductEditBloc>()
              .add(ProductEditEvent.removeSize(size.toSize())),
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_up,
          color: kPrimaryColor,
          onTap: !isFirst
              ? () => context
                  .bloc<ProductEditBloc>()
                  .add(ProductEditEvent.moveSize(size.toSize(), -1))
              : null,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_down,
          color: kPrimaryColor,
          onTap: !isLast
              ? () => context
                  .bloc<ProductEditBloc>()
                  .add(ProductEditEvent.moveSize(size.toSize(), 1))
              : null,
        ),
      ],
    );
  }
}
