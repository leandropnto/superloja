import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/presentation/core/constants.dart';

class QuantityProduct extends StatelessWidget {
  final CartProduct item;

  const QuantityProduct({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => Column(
              children: <Widget>[
                IconButton(
                  disabledColor: kPrimaryLightColor,
                  icon: Icon(FontAwesome.plus_circle),
                  color: kPrimaryColor,
                  onPressed: _hasStock(item)
                      ? () => context
                          .bloc<CartBloc>()
                          .add(CartEvent.add(item ))
                      : null,
                ),
                Text("${item.quantity}"),
                IconButton(
                  icon: Icon(FontAwesome.minus_circle),
                  color: kPrimaryColor,
                  onPressed: () {
                    context
                        .bloc<CartBloc>()
                        .add(CartEvent.remove(item));
                  },
                ),
              ],
            ));
  }

  bool _hasStock(CartProduct item) {
    try {
      final size = item.product.sizes.firstWhere(
          (e) => e.sizeName.getOrCrash() == item.size.sizeName.getOrCrash());
      return size.stock.getOrCrash() > item.quantity;
    } catch (e) {
      return false;
    }
  }
}
