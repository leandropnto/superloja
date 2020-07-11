import 'package:flutter/material.dart';
import 'package:superloja/domain/section/section.dart';

class SectionProducts extends StatelessWidget {
  final List<Section> sections;

  const SectionProducts({Key key, this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sections.forEach((element) => print(element.name));
    return Container();
  }
}
