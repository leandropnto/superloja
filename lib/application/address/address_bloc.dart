import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/cep/address.dart';
import 'package:superloja/domain/cep/i_cep_service.dart';
import 'package:superloja/domain/cep/value_objects.dart';
import 'package:superloja/domain/core/failures.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final ICepService _cepService;

  AddressBloc(this._cepService)
      : assert(_cepService != null),
        super(AddressState.empty());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    yield* event.map(
        initial: (e) async* {},
        loading: (e) async* {
          yield state.copyWith(isLoading: true);
          final cep = Cep(state.strCep);
          final either = await _cepService.getAddressFromCep(cep);
          yield state.copyWith(
              isLoading: false,
              cep: some(cep),
              failureOrSuccess:
                  some(either.fold((l) => left(l), (r) => right(r))));
        },
        failure: (e) async* {
          yield state.copyWith(isLoading: false);
        },
        onChangeCep: (e) async* {
          yield state.copyWith(strCep: e.cepStr);
        },
        clear: (e) async* {
          yield state.copyWith(strCep: '', cep: none());
        });
  }
}
