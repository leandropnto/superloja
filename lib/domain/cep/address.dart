class Address {
  Cidade cidade;
  Estado estado;
  double altitude;
  String longitude;
  String bairro;
  String complemento;
  String cep;
  String logradouro;
  String latitude;

  Address(
      {this.cidade,
      this.estado,
      this.altitude,
      this.longitude,
      this.bairro,
      this.complemento,
      this.cep,
      this.logradouro,
      this.latitude});

  Address.fromJson(Map<String, dynamic> json) {
    cidade =
        json['cidade'] != null ? Cidade.fromJson(json['cidade'] as Map<String, dynamic>) : null;
    estado =
        json['estado'] != null ? Estado.fromJson(json['estado'] as Map<String, dynamic>) : null;
    altitude = json['altitude'] as double ;
    longitude = json['longitude'] as String ;
    bairro = json['bairro'] as String;
    complemento = json['complemento'] as String ;
    cep = json['cep'] as String;
    logradouro = json['logradouro'] as String;
    latitude = json['latitude'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cidade != null) {
      data['cidade'] = cidade.toJson();
    }
    if (estado != null) {
      data['estado'] = estado.toJson();
    }
    data['altitude'] = altitude;
    data['longitude'] = longitude;
    data['bairro'] = bairro;
    data['complemento'] = complemento;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['latitude'] = latitude;
    return data;
  }
}

class Cidade {
  String ibge;
  String nome;
  int ddd;

  Cidade({this.ibge, this.nome, this.ddd});

  Cidade.fromJson(Map<String, dynamic> json) {
    ibge = json['ibge'] as String;
    nome = json['nome'] as String;
    ddd = json['ddd'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ibge'] = ibge;
    data['nome'] = nome;
    data['ddd'] = ddd;
    return data;
  }
}

class Estado {
  String sigla;

  Estado({this.sigla});

  Estado.fromJson(Map<String, dynamic> json) {
    sigla = json['sigla'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sigla'] = sigla;
    return data;
  }
}
