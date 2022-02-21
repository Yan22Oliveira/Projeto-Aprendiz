import '../../../../../shared/shared.dart';

class TeacherModel {

  int? id;
  int? ativo;
  UserModel? user;

  TeacherModel({
    this.id,
    this.ativo,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':     id,
      'ativo':  ativo,
      'user':   user,
    };
  }

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id:     json['id'],
      ativo:  json['ativo'],
      user:   UserModel.fromJson(json['user']),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is TeacherModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              ativo == other.ativo &&
              user == other.user);

  @override
  int get hashCode =>
      id.hashCode ^ ativo.hashCode ^ user.hashCode;

  @override
  String toString() {
    return 'TeacherModel{'
        ' id: $id,'
        ' ativo: $ativo,'
        ' user: $user,'
        '}';
  }

  TeacherModel copyWith({
    int? id,
    int? ativo,
    UserModel? user,
  }) {
    return TeacherModel(
      id: id ?? this.id,
      ativo: ativo ?? this.ativo,
      user: user ?? this.user,
    );
  }

}