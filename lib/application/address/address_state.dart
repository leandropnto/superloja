part of 'address_bloc.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @required final Cep cep,
    @required final bool isLoading,
    @required final Option<Either<ValueFailure, Address>> failureOrSuccess,
  }) = _AddressState;

  factory AddressState.empty() => AddressState(
        cep: Cep(''),
        isLoading: false,
        failureOrSuccess: none(),
      );
}
