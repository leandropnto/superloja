part of 'address_bloc.dart';

@freezed
abstract class AddressEvent with _$AddressEvent {
  const factory AddressEvent.initial() = _Initial;
  const factory AddressEvent.loading(Cep cep) = _Loading;
  const factory AddressEvent.failure() = _Failure;


}
