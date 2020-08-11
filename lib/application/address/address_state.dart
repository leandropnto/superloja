part of 'address_bloc.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @required final String strCep,
    @required final Option<Cep> cep,
    @required final bool isLoading,
    @required final Option<Either<ValueFailure, Address>> failureOrSuccess,
  }) = _AddressState;

  factory AddressState.empty() => AddressState(
        cep: none(),
        isLoading: false,
        failureOrSuccess: none(),
        strCep: '',
      );
}
