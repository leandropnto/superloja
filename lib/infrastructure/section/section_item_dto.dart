import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/section/section_item.dart';

part 'section_item_dto.freezed.dart';

part 'section_item_dto.g.dart';

@freezed
abstract class SectionItemDto implements _$SectionItemDto {
  const factory SectionItemDto({
    @required final String image,
    final String product,
  }) = _SectionItemDto;

  factory SectionItemDto.fromJson(Map<String, dynamic> json) =>
      _$SectionItemDtoFromJson(json);

  factory SectionItemDto.fromFirestore(DocumentSnapshot doc) {
    return SectionItemDto.fromJson(doc.data);
  }

  factory SectionItemDto.fromDomain(SectionItem sectionItem) {
    return SectionItemDto(
      image: sectionItem.image as String,
      product: sectionItem.product
    );
  }

  SectionItem toDomain() {
    return SectionItem(image: image, product: product ?? "");
  }

  const SectionItemDto._();
}
