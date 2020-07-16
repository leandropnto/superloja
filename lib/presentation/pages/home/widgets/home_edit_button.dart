import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';

class HomeEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeMap(
          authenticated: (e) => e.user.isAdmin
              ? BlocBuilder<SectionBloc, SectionState>(
                  builder: (_, stateSection) => stateSection.isEditting
                      ? PopupMenuButton(
                          onSelected: (e) => e == "Salvar"
                              ? context
                                  .bloc<SectionBloc>()
                                  .add(const SectionEvent.onSaveEditting())
                              : context
                                  .bloc<SectionBloc>()
                                  .add(const SectionEvent.onCancelEditting()),
                          itemBuilder: (_) => ['Salvar', 'Descartar']
                              .map((e) => PopupMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        )
                      : IconButton(
                          icon: Icon(FontAwesome.edit),
                          onPressed: () => context
                              .bloc<SectionBloc>()
                              .add(const SectionEvent.onEditting()),
                        ),
                )
              : Container(),
          orElse: () => Container()),
    );
  }
}
