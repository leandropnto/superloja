import 'package:superloja/domain/address/state.dart';
import 'package:superloja/domain/cep/address_coordenates.dart';

import 'city.dart';

class Address {
  final City city;
  final State state;
  final AddressCoordenates coordenates;
  final String districty;
  final String complement;
  final String zipcode;
  final String street;

  Address(
      {this.city,
      this.state,
      this.coordenates,
      this.districty,
      this.complement,
      this.zipcode,
      this.street});
}
