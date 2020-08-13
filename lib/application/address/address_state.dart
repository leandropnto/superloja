part of 'address_bloc.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @required final Cep cep,
    @required final AddressNumber number,
    @required final AddressComplement complement,
    @required final bool isLoading,
    @required final Option<Either<ValueFailure, Address>> failureOrSuccess,
  }) = _AddressState;

  factory AddressState.empty() => AddressState(
        isLoading: false,
        failureOrSuccess: none(),
        cep: Cep(''),
        number: AddressNumber(''),
        complement: AddressComplement(''),
      );
}
