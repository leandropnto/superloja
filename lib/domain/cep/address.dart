import 'package:superloja/domain/cep/address_coordenates.dart';

class Address {
  final City cidade;
  final State estado;
  final AddressCoordenates coordenates;
  final String bairro;
  final String complemento;
  final String cep;
  final String logradouro;

  Address(
      {this.cidade,
      this.estado,
      this.coordenates,
      this.bairro,
      this.complemento,
      this.cep,
      this.logradouro});
}

class City {
  String ibge;
  String nome;
  int ddd;

  City({this.ibge, this.nome, this.ddd});
}

class State {
  String sigla;

  State({this.sigla});
}
