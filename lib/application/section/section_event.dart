part of 'section_bloc.dart';

@freezed
abstract class SectionEvent with _$SectionEvent {
  const factory SectionEvent.watchAll() = _WatchAll;

  const factory SectionEvent.sectionsReceived(
          Either<SectionFailure, List<Section>> failureOrSections) =
      _SectionsReceived;

  const factory SectionEvent.onEditting() = _OnEditting;

  const factory SectionEvent.onCancelEditting() = _OnCancelEditting;

  const factory SectionEvent.onSaveEditting() = _OnSaveEditting;

  const factory SectionEvent.onResfreshEditting(Section section) =
      _OnResfreshEditting;

  const factory SectionEvent.onAddSection(String type) = _OnAddSection;

  const factory SectionEvent.onRemoveSection(Section section) =
      _OnRemoveSection;

  const factory SectionEvent.onRemoveItem(SectionItem item, Section section) =
      _OnRemoveItem;

  const factory SectionEvent.onUnatachItem(SectionItem item, Section section) =
      _OnUnatachItem;

  const factory SectionEvent.onAttachItem(
      SectionItem item, Section section, String productId) = _OnAttachItem;

  const factory SectionEvent.onUpdateProduct(SectionItem item) =
      _OnUpdateProduct;


  const factory SectionEvent.onMoveSection(Section section, int movement) =
  _OnMoveSection;

}
