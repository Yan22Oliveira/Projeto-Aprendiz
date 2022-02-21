import './address_model.dart';

class ChurchModel {

  int? id;
  String? nome;
  int? idArea;
  String? nomeArea;
  int? idRegiao;
  String? nomeRegiao;
  AddressModel? endereco;

  ChurchModel({
    this.id,
    this.nome,
    this.idArea,
    this.nomeArea,
    this.idRegiao,
    this.nomeRegiao,
    this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':         id,
      'nome':       nome,
      'idArea':     idArea,
      'nomeArea':   nomeArea,
      'idRegiao':   idRegiao,
      'nomeRegiao': nomeRegiao,
      'endereco':   endereco,
    };
  }

  factory ChurchModel.fromJson(Map<String, dynamic> json) {
    return ChurchModel(
      id:         json['id'],
      nome:       json['nome'],
      idArea:     json['idArea'],
      nomeArea:   json['nomeArea'],
      idRegiao:   json['idRegiao'],
      nomeRegiao: json['nomeRegiao'],
      endereco: AddressModel.fromJson(json['endereco']),
    );
  }

  factory ChurchModel.fromMap(Map<String, dynamic> map) {
    return ChurchModel(
      id:         map['id'],
      nome:       map['nome'],
      idArea:     map['idArea'],
      nomeArea:   map['nomeArea'],
      idRegiao:   map['idRegiao'],
      nomeRegiao: map['nomeRegiao'],
      endereco: AddressModel.fromJson(map['endereco']),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ChurchModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nome == other.nome &&
              idArea == other.idArea &&
              nomeArea == other.nomeArea &&
              idRegiao == other.idRegiao &&
              nomeRegiao == other.nomeRegiao);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      idArea.hashCode ^
      nomeArea.hashCode ^
      idRegiao.hashCode ^
      nomeRegiao.hashCode;

  @override
  String toString() {
    return 'ChurchModel{'
        ' id: $id,'
        ' nome: $nome,'
        ' idArea: $idArea,'
        ' nomeArea: $nomeArea,'
        ' idRegiao: $idRegiao,'
        ' nomeRegiao: $nomeRegiao,'
        ' endereco: $endereco,'
        '}';
  }

  ChurchModel copyWith({
    int? id,
    String? nome,
    int? idArea,
    String? nomeArea,
    int? idRegiao,
    String? nomeRegiao,
  }) {
    return ChurchModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idArea: idArea ?? this.idArea,
      nomeArea: nomeArea ?? this.nomeArea,
      idRegiao: idRegiao ?? this.idRegiao,
      nomeRegiao: nomeRegiao ?? this.nomeRegiao,
    );
  }

}