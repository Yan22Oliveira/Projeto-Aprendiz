class ShepherdModel {

  int? id;
  String? name;
  String? email;
  String? telefone;

  ShepherdModel({
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

  factory ShepherdModel.fromJson(Map<String, dynamic> json) {
    return ShepherdModel(
      id:       json['id'],
      name:     json['name'],
      email:    json['email'],
      telefone: json['telefone'],
    );
  }

  factory ShepherdModel.fromMap(Map<String, dynamic> map) {
    return ShepherdModel(
      id:       map['id'] as int,
      name:     map['name'] as String,
      email:    map['email'] as String,
      telefone: map['telefone'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShepherdModel &&
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
    return 'ShepherdModel{'
        ' id: $id,'
        ' name: $name,'
        ' email: $email,'
        ' telefone: $telefone,'
        '}';
  }

  ShepherdModel copyWith({
    int? id,
    String? name,
    String? email,
    String? telefone,
  }) {
    return ShepherdModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
    );
  }

}