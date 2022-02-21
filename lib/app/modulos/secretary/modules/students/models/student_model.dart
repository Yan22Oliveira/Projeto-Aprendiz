import '../../../../../shared/shared.dart';

class StudentModel {

  int? id;
  int? classe;
  int? ativo;
  UserModel? user;

  StudentModel({
    this.id,
    this.classe,
    this.ativo,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':     id,
      'classe': classe,
      'ativo':  ativo,
      'user':   user,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id:     json['id'],
      classe: json['classe'],
      ativo:  json['ativo'],
      user:   UserModel.fromJson(json['user']),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is StudentModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              classe == other.classe &&
              ativo == other.ativo &&
              user == other.user);

  @override
  int get hashCode =>
      id.hashCode ^ classe.hashCode ^ ativo.hashCode ^ user.hashCode;

  @override
  String toString() {
    return 'StudentModel{'
        ' id: $id,'
        ' classe: $classe,'
        ' ativo: $ativo,'
        ' user: $user,'
        '}';
  }

  StudentModel copyWith({
    int? id,
    int? classe,
    int? ativo,
    UserModel? user,
  }) {
    return StudentModel(
      id: id ?? this.id,
      classe: classe ?? this.classe,
      ativo: ativo ?? this.ativo,
      user: user ?? this.user,
    );
  }

}