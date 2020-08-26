import 'package:flutter/foundation.dart';
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
  final String number;

  const Address({
    @required this.city,
    @required this.state,
    @required this.coordenates,
    @required this.districty,
    @required this.complement,
    @required this.zipcode,
    @required this.street,
    @required this.number,
  });

  Address copyWith({
    City city,
    State state,
    AddressCoordenates coordenates,
    String districty,
    String complement,
    String zipcode,
    String street,
    String number,
  }) {
    if ((city == null || identical(city, this.city)) &&
        (state == null || identical(state, this.state)) &&
        (coordenates == null || identical(coordenates, this.coordenates)) &&
        (districty == null || identical(districty, this.districty)) &&
        (complement == null || identical(complement, this.complement)) &&
        (zipcode == null || identical(zipcode, this.zipcode)) &&
        (street == null || identical(street, this.street)) &&
        (number == null || identical(number, this.number))) {
      return this;
    }

    return Address(
      city: city ?? this.city,
      state: state ?? this.state,
      coordenates: coordenates ?? this.coordenates,
      districty: districty ?? this.districty,
      complement: complement ?? this.complement,
      zipcode: zipcode ?? this.zipcode,
      street: street ?? this.street,
      number: number ?? this.number,
    );
  }

  @override
  String toString() {
    return 'Address{city: $city, state: $state, coordenates: $coordenates,'
        ' districty: $districty, complement: $complement, zipcode: $zipcode, '
        'street: $street, number: $number}';
  }
}
