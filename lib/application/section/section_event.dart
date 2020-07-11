part of 'section_bloc.dart';

@freezed
abstract class SectionEvent with _$SectionEvent {
  const factory SectionEvent.watchAll() = _WatchAll;

  const factory SectionEvent.sectionsReceived(
          Either<SectionFailure, List<Section>> failureOrSections) =
      _SectionsReceived;
}
