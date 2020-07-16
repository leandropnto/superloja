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
  const factory SectionEvent.onResfreshEditting(SectionView section) = _OnResfreshEditting;
  const factory SectionEvent.onAddSection(String type) = _OnAddSection;
  const factory SectionEvent.onRemoveSection(SectionView section) = _OnRemoveSection;
}
