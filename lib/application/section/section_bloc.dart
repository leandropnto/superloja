import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/presentation/pages/home/view_model/section_view.dart';

part 'section_event.dart';

part 'section_state.dart';

part 'section_bloc.freezed.dart';

@injectable
class SectionBloc extends Bloc<SectionEvent, SectionState> {
  final ISectionRepository _sectionRepository;
  StreamSubscription<Either<SectionFailure, List<Section>>> _streamSubscription;

  SectionBloc(this._sectionRepository) : super(SectionState.initial());

  @override
  Stream<SectionState> mapEventToState(
    SectionEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield state.copyWith(isLoading: true);
        _streamSubscription?.cancel();
        _streamSubscription = _sectionRepository.watchSections().listen(
            (failureOrSections) =>
                add(SectionEvent.sectionsReceived(failureOrSections)));
      },
      sectionsReceived: (e) async* {
        yield e.failureOrSections.fold(
            (f) => state.copyWith(
                  sectionFailure: some(f),
                  isLoading: false,
                ), (sections) {
          return state.copyWith(
            sections: sections.map((e) => SectionView.from(e)).toList(),
            edittingSections: sections.map((e) => SectionView.from(e)).toList(),
            isLoading: false,
          );
        });
      },
      onEditting: (e) async* {
        yield state.copyWith(isEditting: !state.isEditting);
      },
      onCancelEditting: (e) async* {
        final editting = !state.isEditting;
        yield state
            .copyWith(isEditting: false, edittingSections: [...state.sections]);
      },
      onSaveEditting: (e) async* {
        print("Salvando a tela");
        yield state.copyWith(isEditting: !state.isEditting);
      },
      onAddSection: (e) async* {
        yield state.copyWith(edittingSections: [
          ...state.edittingSections,
          SectionView.from(Section(
            name: "Nova",
            type: e.type,
            items: [],
          )),
        ]);
      },
      onRemoveSection: (e) async* {
        print("Removendo");
        yield state.copyWith(
          edittingSections:
              state.edittingSections.where((l) => l != e.section).toList(),
        );
      },
      onResfreshEditting: (e) async* {
//        final index = state.edittingSections.indexOf(e.section);
//        if (index >= 0) {
//          final items = state.edittingSections
//            ..removeAt(index)
//            ..insert(index, e.section);
//
//          yield state.copyWith(edittingSections: items);
//        }
        yield state.copyWith(isLoading: true);
        final updated = state.edittingSections
            .map((l) => l.id == e.section.id ? e.section : l)
            .toList();
        yield state.copyWith(edittingSections: updated, isLoading: false);
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
