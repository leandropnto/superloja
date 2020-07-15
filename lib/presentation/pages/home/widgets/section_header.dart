import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/core/constants.dart';

class SectionHeader extends StatelessWidget {
  final Section section;

  const SectionHeader({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
  }
}
