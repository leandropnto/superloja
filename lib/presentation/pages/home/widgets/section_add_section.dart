import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class SectionAddSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            onPressed: () =>
                context.bloc<SectionBloc>().add(const SectionEvent.onAddSection('List')),
            splashColor: kPrimaryColor.withOpacity(.3),
            child: Text(
              'Adicionar Lista',
              style: style,
            ),
          ),
          FlatButton(
            onPressed: () =>
                context.bloc<SectionBloc>().add(const SectionEvent.onAddSection('Staggered')),
            splashColor: kPrimaryColor.withOpacity(.3),
            child: Text(
              'Adicionar Grade',
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
