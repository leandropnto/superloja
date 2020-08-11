part of 'address_bloc.dart';

@freezed
abstract class AddressEvent with _$AddressEvent {
  const factory AddressEvent.initial() = _Initial;
  const factory AddressEvent.loading() = _Loading;
  const factory AddressEvent.failure() = _Failure;
  const factory AddressEvent.clear() = _Clear;
  const factory AddressEvent.onChangeCep(String cepStr) = _OnChangeCep;
}
