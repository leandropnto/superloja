import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/domain/product/value_objects.dart';
import 'package:superloja/infrastructure/core/server_timestamp_converter.dart';

part 'product_dto.freezed.dart';

part 'product_dto.g.dart';

@freezed
abstract class ProductDto implements _$ProductDto {
  const factory ProductDto({
    @JsonKey(ignore: true) String id,
    String name,
    String description,
    List<String> images,
    List<dynamic> sizes,
    @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _ProductDto;

  factory ProductDto.fromDomain(Product product) {
    return ProductDto(
      id: product.id.getOrCrash(),
      name: product.name.getOrCrash(),
      description: product.description.getOrCrash(),
      images: product.images.map((e) => e as String).toList(),
      sizes: product.sizes.map((e) => e.toMap()).toList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Product toDomain() {
    return Product(
      id: UniqueId.fromUniqueString(id),
      name: ProductName(name),
      description: ProductDescription(description),
      images: images,
      sizes: sizes
              ?.map((e) => ProductSize.fromMap(e as Map<String, dynamic>))
              ?.toList() ??
          [],
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  factory ProductDto.fromFirestore(DocumentSnapshot doc) {
    return ProductDto.fromJson(doc.data).copyWith(id: doc.documentID);
  }

  const ProductDto._();
}
