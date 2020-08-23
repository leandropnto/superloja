import 'package:flutter/material.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_item.dart';
import 'package:superloja/presentation/core/constants.dart';

class SectionProductDialog extends StatelessWidget {
  final SectionItem sectionItem;
  final Section section;

  const SectionProductDialog({
    Key key,
    this.sectionItem,
    this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
    return AlertDialog(
      title: const Text('Editar Item'),
      content: sectionItem.product.isNotEmpty
          ? ListTile(
              contentPadding: EdgeInsets.zero,
              key: ObjectKey("ListTile$sectionItem"),
//                leading: state.product.images.isNotEmpty
//                    ? FadeInImage.memoryNetwork(
//                        placeholder: kTransparentImage,
//                        image: state.product.images.first as String,
//                        fit: BoxFit.cover)
//                    : const Text(
//                        "Sem imagens",
//                        style: TextStyle(
//                          color: kPrimaryColor,
//                          fontSize: 12,
//                          fontWeight: FontWeight.w300,
//                        ),
//                      ),
//                subtitle: Text(
//                  state.product.minPrice.price.value.fold(
//                      (l) => "Inválido", (r) => "R\$ ${r.toStringAsFixed(2)}"),
//                  style: TextStyle(
//                    color: Colors.grey[600],
//                  ),
//                ),
//                title: Text(
//                  state.product.name.value.fold((l) => "", (r) => r),
//                  style: const TextStyle(
//                    color: kPrimaryColor,
//                    fontSize: 12,
//                    fontWeight: FontWeight.w300,
//                  ),
//                ),
            )
          : Container(
              height: 60,
            ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
//              context
//                  .bloc<SectionBloc>()
//                  .add(SectionEvent.onRemoveItem(sectionItem, section));
//              Navigator.of(context).pop();
          },
          textColor: Colors.red,
          child: const Text('Excluir'),
        ),
        FlatButton(
          onPressed: () async {
            if (sectionItem.product.isNotEmpty) {
//                context
//                    .bloc<SectionBloc>()
//                    .add(SectionEvent.onUnatachItem(sectionItem, section));
            } else {
              final selectedProduct =
                  await Navigator.of(context).pushNamed("/product/attach");
              if (selectedProduct != null) {
                final id = (selectedProduct as Product).id.getOrCrash();
//                  context.bloc<SectionBloc>().add(SectionEvent.onAttachItem(
//                      sectionItem, section, id));
              }
            }
            Navigator.of(context).pop();
          },
          textColor: kPrimaryColor,
          child: Text(sectionItem.product.isNotEmpty
              ? 'Desvincular Produto'
              : 'Vincular Produto'),
        ),
      ],
    );
//    });
  }
}
