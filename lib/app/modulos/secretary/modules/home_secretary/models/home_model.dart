import './informacao_model.dart';

class HomeModel {

  int? id;
  int? status;
  int? idSecretario;
  String? nomeSecretario;
  String? dataCadastro;
  bool? ativo;
  List<InformacaoModel> listInformacoes;

  HomeModel({
    this.id,
    this.status,
    this.idSecretario,
    this.nomeSecretario,
    this.dataCadastro,
    this.ativo,
    this.listInformacoes =  const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id':             id,
      'status':         status,
      'idSecretario':   idSecretario,
      'nomeSecretario': nomeSecretario,
      'dataCadastro':   dataCadastro,
      'ativo':          ativo,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    List informacoes = map['informacoes'];
    return HomeModel(
      id:              map['id'],
      status:          map['status'],
      idSecretario:    map['idSecretario'],
      nomeSecretario:  map['nomeSecretario'],
      dataCadastro:    map['dataCadastro'],
      ativo:           map['ativo'],
      listInformacoes: informacoes.map((informacao) =>
          InformacaoModel.fromJson(informacao)).toList(),
    );
  }

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List informacoes = json['informacoes'];
    return HomeModel(
      id:              json['id'],
      status:          json['status'],
      idSecretario:    json['idSecretario'],
      nomeSecretario:  json['nomeSecretario'],
      dataCadastro:    json['dataCadastro'],
      ativo:           json['ativo'],
      listInformacoes: informacoes.map((informacao) =>
          InformacaoModel.fromJson(informacao)).toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is HomeModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              status == other.status &&
              idSecretario == other.idSecretario &&
              nomeSecretario == other.nomeSecretario &&
              dataCadastro == other.dataCadastro &&
              ativo == other.ativo);

  @override
  int get hashCode =>
      id.hashCode ^
      status.hashCode ^
      idSecretario.hashCode ^
      nomeSecretario.hashCode ^
      dataCadastro.hashCode ^
      ativo.hashCode;

  HomeModel copyWith({
    int? id,
    int? status,
    int? idSecretario,
    String? nomeSecretario,
    String? dataCadastro,
    bool? ativo,
  }) {
    return HomeModel(
      id: id ?? this.id,
      status: status ?? this.status,
      idSecretario: idSecretario ?? this.idSecretario,
      nomeSecretario: nomeSecretario ?? this.nomeSecretario,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      ativo: ativo ?? this.ativo,
    );
  }

  @override
  String toString() {
    return 'HomeModel{'
        ' id: $id,'
        ' status: $status,'
        ' idSecretario: $idSecretario,'
        ' nomeSecretario: $nomeSecretario,'
        ' dataCadastro: $dataCadastro,'
        ' ativo: $ativo,'
        '}';
  }

}