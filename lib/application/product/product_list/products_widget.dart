import 'package:flutter/material.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductsWidget extends StatelessWidget {
  final List<Product> products;

  const ProductsWidget({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              "/productByProduct",
              arguments: product,
            ),
            child: Card(
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        product.images.first as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.name.value
                                .fold((f) => "Nome inválido", (nome) => nome),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'A partir de',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            product.minPrice.price.value.fold(
                                (l) => "Preço inválido",
                                (r) => "R\$ ${r.toStringAsFixed(2)}"),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
