
import 'package:equatable/equatable.dart';
import 'package:superloja/domain/section/section_item.dart';

class SectionItemView extends Equatable{
  dynamic image;
  String product;

  SectionItemView({
    this.image,
    this.product,
  });

  factory SectionItemView.empty() => SectionItemView(image: '', product: '');

  factory SectionItemView.from(SectionItem item) {
    return SectionItemView(
      product: item.product,
      image: item.image,
    );
  }

  SectionItem toSectionItem() {
    return SectionItem(image: image, product: product);
  }

  @override
  List<Object> get props => [image, product];
}
