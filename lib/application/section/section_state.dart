part of 'section_bloc.dart';

@freezed
abstract class SectionState with _$SectionState {
  const factory SectionState({
    @required final bool isEditting,
    @required final bool isLoading,
    @required final List<SectionView> sections,
    @required final List<SectionView> edittingSections,
    @required final Option<SectionFailure> sectionFailure,
  }) = _SectionState;

  factory SectionState.initial() => SectionState(
        isLoading: false,
        isEditting: false,
        sections: [],
        edittingSections: [],
        sectionFailure: none(),
      );
}
