import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/section/section.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/domain/section/section_item.dart';
import 'package:uuid/uuid.dart';

part 'section_event.dart';

part 'section_state.dart';

part 'section_bloc.freezed.dart';

@injectable
class SectionBloc extends Bloc<SectionEvent, SectionState> {
  final ISectionRepository _sectionRepository;
  final IProductRepository _productRepository;

  StreamSubscription<Either<SectionFailure, List<Section>>> _streamSubscription;

  SectionBloc(this._sectionRepository, this._productRepository)
      : assert(_sectionRepository != null),
        assert(_productRepository != null),
        super(SectionState.initial());

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
            sections: sections,
            edittingSections: [...sections],
            isLoading: false,
          );
        });
      },
      onEditting: (e) async* {
        yield state.copyWith(isEditting: !state.isEditting);
      },
      onCancelEditting: (e) async* {
        yield state
            .copyWith(isEditting: false, edittingSections: [...state.sections]);
      },
      onSaveEditting: (e) async* {
        yield state.copyWith(isEditting: !state.isEditting);
      },
      onAddSection: (e) async* {
        yield state.copyWith(edittingSections: [
          ...state.edittingSections,
          Section(
            id: Uuid().v1(),
            name: "Nova",
            type: e.type,
            items: [],
          ),
        ]);
      },
      onRemoveSection: (e) async* {
        yield state.copyWith(
          edittingSections:
              state.edittingSections.where((l) => l != e.section).toList(),
        );
      },
      onResfreshEditting: (e) async* {
        yield state.copyWith(isLoading: true);
        final updated = state.edittingSections
            .map((l) => l.id == e.section.id ? e.section : l)
            .toList();
        yield state.copyWith(edittingSections: updated, isLoading: false);
      },
      onRemoveItem: (e) async* {
        yield state.copyWith(isLoading: true);
        final updated = state.edittingSections
            .map(
              (s) => s.id == e.section.id
                  ? s.copyWith(items: s.items..remove(e.item))
                  : s,
            )
            .toList();

        yield state.copyWith(edittingSections: updated, isLoading: false);
      },
      onUpdateProduct: (e) async* {
        yield state.copyWith(isLoading: true);
        final either = await _productRepository.getProduct(e.item.product);
        yield either.fold(
            (l) => state.copyWith(
                  isLoading: false,
                ),
            (r) => state.copyWith(
                  product: r,
                  isLoading: false,
                ));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
