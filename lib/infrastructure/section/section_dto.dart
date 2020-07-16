import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/section/section.dart';

import 'section_item_dto.dart';

part 'section_dto.freezed.dart';

part 'section_dto.g.dart';

@freezed
abstract class SectionDto implements _$SectionDto {
  const factory SectionDto({
    @JsonKey(ignore: true) String id,
    @required final String name,
    @required final String type,
    @required final List<SectionItemDto> items,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);

  factory SectionDto.fromFirestore(DocumentSnapshot doc) {
    return SectionDto.fromJson(doc.data).copyWith(id: doc.documentID);
  }

  Section toDomain() {
    return Section(
      id: id,
      name: name,
      type: type,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  const SectionDto._();
}
