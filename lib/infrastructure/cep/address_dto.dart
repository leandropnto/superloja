import 'package:superloja/domain/address/address.dart';
import 'package:superloja/domain/address/city.dart';
import 'package:superloja/domain/address/state.dart';
import 'package:superloja/domain/cep/address_coordenates.dart';

class AddressDto {
  final double altitude;
  final String cep;
  final double latitude;
  final double longitude;
  final String logradouro;
  final String bairro;
  final CidadeDto cidade;
  final EstadoDto estado;

  AddressDto.fromMap(Map<String, dynamic> map)
      : altitude = map['altitude'] as double,
        cep = map['cep'] as String,
        latitude = double.tryParse(map['latitude'] as String),
        longitude = double.tryParse(map['longitude'] as String),
        logradouro = map['logradouro'] as String,
        bairro = map['bairro'] as String,
        cidade = CidadeDto.fromMap(map['cidade'] as Map<String, dynamic>),
        estado = EstadoDto.fromMap(map['estado'] as Map<String, dynamic>);

  Address toDomain() {
    return Address(
      districty: bairro,
      zipcode: cep,
      city: cidade.toDomain(),
      coordenates: AddressCoordenates(
        altitude: 0,
        latitude: latitude,
        longitude: longitude,
      ),
      street: logradouro,
      state: State(sigla: estado.sigla),
    );
  }
}

class CidadeDto {
  final String nome;
  final String ibge;
  final int ddd;

  const CidadeDto({this.nome, this.ibge, this.ddd});

  factory CidadeDto.fromMap(Map<String, dynamic> map) {
    return CidadeDto(
      nome: map['nome'] as String,
      ibge: map['ibge'] as String,
      ddd: map['ddd'] as int,
    );
  }

  City toDomain() {
    return City(ddd: ddd, ibge: ibge, nome: nome);
  }
}

class EstadoDto {
  final String sigla;

  const EstadoDto(this.sigla);

  factory EstadoDto.fromMap(Map<String, dynamic> map) {
    return EstadoDto(map['sigla'] as String);
  }
}
