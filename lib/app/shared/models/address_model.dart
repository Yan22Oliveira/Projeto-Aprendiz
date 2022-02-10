class AddressModel {

  int? id;
  String? cep;
  String? logradouro;
  String? numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? codigoIBGE;
  String? estado;
  double? latitude;
  double? longitude;

  AddressModel({
    this.id,
    this.cep,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.codigoIBGE,
    this.estado,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':          id,
      'cep':         cep,
      'logradouro':  logradouro,
      'numero':      numero,
      'complemento': complemento,
      'bairro':      bairro,
      'cidade':      cidade,
      'codigoIBGE':  codigoIBGE,
      'estado':      estado,
      'latitude':    latitude,
      'longitude':   longitude,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id:          json['id'],
      cep:         json['cep'],
      logradouro:  json['logradouro'],
      numero:      json['numero'],
      complemento: json['complemento'],
      bairro:      json['bairro'],
      cidade:      json['cidade'],
      codigoIBGE:  json['codigoIBGE'],
      estado:      json['estado'],
      latitude:    json['latitude'],
      longitude:   json['longitude'],
    );
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id:          map['id'],
      cep:         map['cep'],
      logradouro:  map['logradouro'],
      numero:      map['numero'],
      complemento: map['complemento'],
      bairro:      map['bairro'],
      cidade:      map['cidade'],
      codigoIBGE:  map['codigoIBGE'],
      estado:      map['estado'],
      latitude:    map['latitude'],
      longitude:   map['longitude'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AddressModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              cep == other.cep &&
              logradouro == other.logradouro &&
              numero == other.numero &&
              complemento == other.complemento &&
              bairro == other.bairro &&
              cidade == other.cidade &&
              codigoIBGE == other.codigoIBGE &&
              estado == other.estado &&
              latitude == other.latitude &&
              longitude == other.longitude);

  @override
  int get hashCode =>
      id.hashCode ^
      cep.hashCode ^
      logradouro.hashCode ^
      numero.hashCode ^
      complemento.hashCode ^
      bairro.hashCode ^
      cidade.hashCode ^
      codigoIBGE.hashCode ^
      estado.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;

  AddressModel copyWith({
    int? id,
    String? cep,
    String? logradouro,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? codigoIBGE,
    String? estado,
    double? latitude,
    double? longitude,
  }) {
    return AddressModel(
      id: id ?? this.id,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      codigoIBGE: codigoIBGE ?? this.codigoIBGE,
      estado: estado ?? this.estado,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return 'AddressModel{'
        ' id: $id,'
        ' cep: $cep,'
        ' logradouro: $logradouro,'
        ' numero: $numero,'
        ' complemento: $complemento,'
        ' bairro: $bairro,'
        ' cidade: $cidade,'
        ' codigoIBGE: $codigoIBGE,'
        ' estado: $estado,'
        ' latitude: $latitude,'
        ' longitude: $longitude,'
        '}';
  }

}