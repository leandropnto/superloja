import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';
import 'package:superloja/presentation/pages/home/view_model/section_view.dart';

class SectionHeader extends StatelessWidget {
  final SectionView section;

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
                    onChanged: (value) => section.name = value,
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.remove,
                  onTap: () => context.bloc<SectionBloc>().add(
                        SectionEvent.onRemoveSection(section),
                      ),
                  color: kPrimaryColor,
                )
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
