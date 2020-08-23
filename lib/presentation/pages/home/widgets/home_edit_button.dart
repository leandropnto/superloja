import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';

class HomeEditButton extends StatelessWidget {
  final SectionBloc sectionBloc = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthBloc>(
        builder: (bloc) => bloc.admin.value
            ?
            //se for admin verifica se esta editando
            Obx(
                () => sectionBloc.isEditing.value
                    ? PopupMenuButton(
                        onSelected: (e) => e == "Salvar"
                            ? sectionBloc.save()
                            : sectionBloc.cancel(),
                        itemBuilder: (_) => ['Salvar', 'Descartar']
                            .map((e) => PopupMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      )
                    : IconButton(
                        icon: const Icon(FontAwesome.edit),
                        onPressed: () => sectionBloc.setEditting(),
                      ),
              )
            : Container() // se nao for admin esconde o botao

        );
  }
}
