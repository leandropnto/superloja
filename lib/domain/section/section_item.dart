import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_item.freezed.dart';

@freezed
abstract class SectionItem with _$SectionItem {
  const factory SectionItem({
    @required final dynamic image,
    @required final String product,
  }) = _SectionItem;

  factory SectionItem.empty() => const SectionItem(image: '', product: '');

}
