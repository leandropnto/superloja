import 'package:freezed_annotation/freezed_annotation.dart';

import 'section_item.dart';

part 'section.freezed.dart';

@freezed
abstract class Section with _$Section {
  const factory Section({
    @required final String name,
    @required final String type,
    @required final List<SectionItem> items,
  }) = _Section;

  factory Section.empty() => const Section(
        name: '',
        type: '',
        items: [],
      );
}
