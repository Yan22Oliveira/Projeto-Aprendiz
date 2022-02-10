class PastorModel {

  int? id;
  String? name;
  String? email;
  String? telefone;

  PastorModel({
    this.id,
    this.name,
    this.email,
    this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':       id,
      'name':     name,
      'email':    email,
      'telefone': telefone,
    };
  }

  factory PastorModel.fromJson(Map<String, dynamic> json) {
    return PastorModel(
      id:       json['id'],
      name:     json['name'],
      email:    json['email'],
      telefone: json['telefone'],
    );
  }

  factory PastorModel.fromMap(Map<String, dynamic> map) {
    return PastorModel(
      id:       map['id'] as int,
      name:     map['name'] as String,
      email:    map['email'] as String,
      telefone: map['telefone'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PastorModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          telefone == other.telefone);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ telefone.hashCode;

  @override
  String toString() {
    return 'PastorModel{'
        ' id: $id,'
        ' name: $name,'
        ' email: $email,'
        ' telefone: $telefone,'
        '}';
  }

  PastorModel copyWith({
    int? id,
    String? name,
    String? email,
    String? telefone,
  }) {
    return PastorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
    );
  }

}