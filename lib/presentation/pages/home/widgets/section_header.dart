import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_icon_button.dart';

class SectionHeader extends StatelessWidget {
  final Section section;

  const SectionHeader({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionBloc>(
      builder: (bloc) => Obx(
        () => bloc.isEditing.value
            ? Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      initialValue: section.name,
                      decoration: const InputDecoration(
                        hintText: 'Título',
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      onChanged: (value) =>
                          bloc.sectionChangeTitle(section, value),
                    ),
                  ),
                  CustomIconButton(
                    iconData: Icons.arrow_drop_down,
                    onTap: () => bloc.moveSection(section, 1),
                    color: kPrimaryColor,
                  ),
                  CustomIconButton(
                    iconData: Icons.arrow_drop_up,
                    onTap: () => bloc.moveSection(section, -1),
                    color: kPrimaryColor,
                  ),
                  CustomIconButton(
                    iconData: Icons.remove,
                    onTap: () => bloc.removeSection(section),
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
              ),
      ),
    );
  }
}
