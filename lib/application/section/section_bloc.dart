import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_failure.dart';

part 'section_event.dart';

part 'section_state.dart';

part 'section_bloc.freezed.dart';

@injectable
class SectionBloc extends Bloc<SectionEvent, SectionState> {
  final ISectionRepository _sectionRepository;
  StreamSubscription<Either<SectionFailure, List<Section>>> _streamSubscription;

  SectionBloc(this._sectionRepository) : super(const SectionState.initial());

  @override
  Stream<SectionState> mapEventToState(
    SectionEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield const SectionState.loadInProgress();
        _streamSubscription?.cancel();
        _streamSubscription = _sectionRepository.watchProducts().listen(
            (failureOrSections) =>
                add(SectionEvent.sectionsReceived(failureOrSections)));
      },
      sectionsReceived: (e) async* {
        yield e.failureOrSections.fold((f) => SectionState.loadFailure(f),
            (sections) {
          return SectionState.loadSuccess(sections);
        });
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
