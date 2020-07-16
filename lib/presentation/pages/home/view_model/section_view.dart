import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/presentation/pages/home/view_model/section_item_view.dart';

class SectionView extends Equatable {
  String id;
  String name;
  String type;
  List<SectionItemView> items;

  SectionView({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.items,
  });

  factory SectionView.empty() => SectionView(
        id: '',
        name: '',
        type: '',
        items: [],
      );

  factory SectionView.from(Section item) {
    return SectionView(
        id: item.id,
        items: item.items.map((e) => SectionItemView.from(e)).toList(),
        type: item.type,
        name: item.name);
  }

  Section toSection() {
    return Section(
      id: id,
      name: name,
      type: type,
      items: items.map((e) => e.toSectionItem()).toList(),
    );
  }

  void addItem(SectionItemView item) {
    items.add(item);
  }

  @override
  List<Object> get props => [id];
}
