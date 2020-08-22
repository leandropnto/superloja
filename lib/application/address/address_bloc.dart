import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/address/address.dart';
import 'package:superloja/domain/cep/i_cep_service.dart';
import 'package:superloja/domain/cep/value_objects.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/distance/i_shippment_service.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final ICepService _cepService;
  final IShippmentService _shippmentService;

  AddressBloc(this._cepService, this._shippmentService)
      : assert(_cepService != null),
        assert(_shippmentService != null),
        super(AddressState.empty());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    yield* event.map(
        initial: (e) async* {},
        loading: (e) async* {
          yield state.copyWith(isLoading: true);
          final either = await _cepService.getAddressFromCep(state.cep);
          yield state.copyWith(
              isLoading: false,
              failureOrSuccess:
                  some(either.fold((l) => left(l), (r) => right(r))));
        },
        failure: (e) async* {
          yield state.copyWith(isLoading: false);
        },
        onChangeCep: (e) async* {
          yield state.copyWith(cep: Cep(e.cepStr));
        },
        clear: (e) async* {
          yield state.copyWith(cep: Cep(''), failureOrSuccess: none());
        },
        onChangeNumber: (e) async* {
          yield state.copyWith(number: AddressNumber(e.number));
        },
        onChangeComplement: (e) async* {
          yield state.copyWith(complement: AddressComplement(e.complement));
        },
        calcShippment: (e) async* {
          state.failureOrSuccess.fold(
              () => {}, //se vazio nao faz nada
              (a) => {
                    a.fold(
                      (l) => {print("Erro $l")}, // se deu erro
                      (address) {
                        _shippmentService
                            .totalCust(address.coordenates.longitude,
                                address.coordenates.latitude)
                            .then(
                              (value) => value.fold(
                                (l) => print("Erro $l"),
                                (r) => print("Total: $r"),
                              ),
                            );
                      },
                    )
                  });
        });
  }
}
