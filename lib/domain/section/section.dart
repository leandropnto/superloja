import 'package:freezed_annotation/freezed_annotation.dart';

import 'section_item.dart';

part 'section.freezed.dart';

@freezed
abstract class Section with _$Section {
  const factory Section({
    @required final String id,
    @required final String name,
    @required final String type,
    @required final int order,
    @required final List<SectionItem> items
  }) = _Section;

  factory Section.empty() => const Section(
        id: '',
        name: '',
        type: '',
        items: [],
        order: 99,
      );
}
