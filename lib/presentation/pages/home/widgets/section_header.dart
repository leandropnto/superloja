import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';

class SectionHeader extends StatelessWidget {
  final Section section;

  const SectionHeader({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
      return state.isEditting
          ? Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    initialValue: section.name,
                    decoration: InputDecoration(
                      hintText: 'Título',
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    onFieldSubmitted: (value) => context
                        .bloc<SectionBloc>()
                        .add(SectionEvent.onResfreshEditting(
                            section.copyWith(name: value))),
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.arrow_drop_down,
                  onTap: () => context.bloc<SectionBloc>().add(
                    SectionEvent.onMoveSection(section, 1),
                  ),
                  color: kPrimaryColor,
                ),
                CustomIconButton(
                  iconData: Icons.arrow_drop_up,
                  onTap: () => context.bloc<SectionBloc>().add(
                    SectionEvent.onMoveSection(section, -1),
                  ),
                  color: kPrimaryColor,
                ),
                CustomIconButton(
                  iconData: Icons.remove,
                  onTap: () => context.bloc<SectionBloc>().add(
                        SectionEvent.onRemoveSection(section),
                      ),
                  color: kPrimaryColor,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                section.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
    });
  }
}
