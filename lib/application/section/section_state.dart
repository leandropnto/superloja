part of 'section_bloc.dart';

@freezed
abstract class SectionState with _$SectionState {
  const factory SectionState({
    @required final bool isEditting,
    @required final bool isLoading,
    @required final List<Section> sections,
    @required final List<Section> edittingSections,
    @required final Option<SectionFailure> sectionFailure,
    @required final Product product,
  }) = _SectionState;

  factory SectionState.initial() => SectionState(
        isLoading: false,
        isEditting: false,
        sections: [],
        edittingSections: [],
        sectionFailure: none(),
        product: Product.empty(),
      );
}
