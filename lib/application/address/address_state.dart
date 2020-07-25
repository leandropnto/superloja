part of 'address_bloc.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @required final String cepStr,
    @required final bool isLoading,
    @required final Option<Either<ValueFailure, Address>> failureOrSuccess,
  }) = _AddressState;

  factory AddressState.empty() => AddressState(
        cepStr: '',
        isLoading: false,
        failureOrSuccess: none(),
      );
}
