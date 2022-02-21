class CourseModel {

  int? id;
  String? nome;

  CourseModel({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':   id,
      'nome': nome,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id:   map['id'],
      nome: map['nome'],
    );
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id:   json['id'],
      nome: json['nome'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CourseModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              nome == other.nome);

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;

  CourseModel copyWith({
    int? id,
    String? nome,
  }) {
    return CourseModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  @override
  String toString() {
    return 'CourseModel{'
        ' id: $id,'
        ' nome: $nome,'
        '}';
  }

}