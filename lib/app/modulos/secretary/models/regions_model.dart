class RegionsModel {

  int? id;
  String? nome;

  RegionsModel({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':   id,
      'nome': nome,
    };
  }

  factory RegionsModel.fromMap(Map<String, dynamic> map) {
    return RegionsModel(
      id:   map['id'] as int,
      nome: map['nome'] as String,
    );
  }

  factory RegionsModel.fromJson(Map<String, dynamic> json) {
    return RegionsModel(
      id:   json['id'],
      nome: json['nome'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is RegionsModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nome == other.nome);

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;

  RegionsModel copyWith({
    int? id,
    String? nome,
  }) {
    return RegionsModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  @override
  String toString() {
    return 'RegionsModel{'
        ' id: $id,'
        ' nome: $nome,'
        '}';
  }

}