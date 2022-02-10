class AreaModel {

  int? id;
  String? nome;
  int? idRegiao;
  String? nomeRegiao;

  AreaModel({
    this.id,
    this.nome,
    this.idRegiao,
    this.nomeRegiao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':         id,
      'nome':       nome,
      'idRegiao':   idRegiao,
      'nomeRegiao': nomeRegiao,
    };
  }

  factory AreaModel.fromMap(Map<String, dynamic> map) {
    return AreaModel(
      id:         map['id'],
      nome:       map['nome'],
      idRegiao:   map['idRegiao'],
      nomeRegiao: map['nomeRegiao'],
    );
  }

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id:         json['id'],
      nome:       json['nome'],
      idRegiao:   json['idRegiao'],
      nomeRegiao: json['nomeRegiao'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AreaModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nome == other.nome &&
              idRegiao == other.idRegiao &&
              nomeRegiao == other.nomeRegiao);

  @override
  int get hashCode =>
      id.hashCode ^ nome.hashCode ^ idRegiao.hashCode ^ nomeRegiao.hashCode;

  @override
  String toString() {
    return 'AreaModel{'
        ' id: $id,'
        ' nome: $nome,'
        ' idRegiao: $idRegiao,'
        ' nomeRegiao: $nomeRegiao,'
        '}';
  }

  AreaModel copyWith({
    int? id,
    String? nome,
    int? idRegiao,
    String? nomeRegiao,
  }) {
    return AreaModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idRegiao: idRegiao ?? this.idRegiao,
      nomeRegiao: nomeRegiao ?? this.nomeRegiao,
    );
  }

}