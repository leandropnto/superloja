part of 'section_bloc.dart';

@freezed
abstract class SectionState with _$SectionState {
  const factory SectionState.initial() = _Initial;
  const factory SectionState.loadInProgress() = _LoadInProgress;
  const factory SectionState.loadSuccess(List<Section> sections) = _LoadSuccess;
  const factory SectionState.loadFailure(SectionFailure sectionFailure) = _LoadFailure;
}
