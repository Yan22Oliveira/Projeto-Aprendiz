import './address_model.dart';
import './church_model.dart';

class UserModel {

  int? id;
  String? email;
  String? nome;
  String? telefone;
  String? dataNascimento;
  String? imagem;
  String? dataCadastro;
  String? dataAtualizacao;
  ChurchModel? igreja;
  AddressModel? endereco;

  UserModel({
    this.id,
    this.email,
    this.nome,
    this.telefone,
    this.imagem,
    this.igreja,
    this.endereco,
    this.dataNascimento,
    this.dataCadastro,
    this.dataAtualizacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':       id,
      'email':    email,
      'nome':     nome,
      'telefone': telefone,
      'imagem':   imagem,
      'igreja':   igreja,
      'endereco':  endereco,
      'dataCadastro':    dataCadastro,
      'dataNascimento':  dataNascimento,
      'dataAtualizacao': dataAtualizacao,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id:       map['id'],
      email:    map['email'],
      nome:     map['nome'],
      telefone: map['telefone'],
      imagem:   map['imagem'],
      dataCadastro:    map['dataCadastro'],
      dataNascimento:  map['dataNascimento'],
      dataAtualizacao: map['dataAtualizacao'],
      igreja:   ChurchModel.fromJson( map['igreja']),
      endereco:  AddressModel.fromJson(map['endereco']),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id:       json['id'],
      email:    json['email'],
      nome:     json['nome'],
      telefone: json['telefone'],
      imagem:   json['imagem'],
      dataCadastro:    json['dataCadastro'],
      dataNascimento:  json['dataNascimento'],
      dataAtualizacao: json['dataAtualizacao'],
      igreja:   ChurchModel.fromJson( json['igreja']),
      endereco:  AddressModel.fromJson(json['endereco']),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is UserModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              dataCadastro == other.dataCadastro &&
              dataAtualizacao == other.dataAtualizacao &&
              email == other.email &&
              nome == other.nome &&
              telefone == other.telefone &&
              dataNascimento == other.dataNascimento &&
              imagem == other.imagem &&
              igreja == other.igreja &&
              endereco == other.endereco);

  @override
  int get hashCode =>
      id.hashCode ^
      dataCadastro.hashCode ^
      dataAtualizacao.hashCode ^
      email.hashCode ^
      nome.hashCode ^
      telefone.hashCode ^
      dataNascimento.hashCode ^
      imagem.hashCode ^
      igreja.hashCode ^
      endereco.hashCode;

  @override
  String toString() {
    return 'UserModel{'
        ' id: $id,'
        ' dataCadastro: $dataCadastro,'
        ' dataAtualizacao: $dataAtualizacao,'
        ' email: $email,'
        ' nome: $nome,'
        ' telefone: $telefone,'
        ' dataNascimento: $dataNascimento,'
        ' imagem: $imagem,'
        ' igreja: $igreja,'
        ' endereco: $endereco,'
        '}';
  }

  UserModel copyWith({
    int? id,
    String? dataCadastro,
    String? dataAtualizacao,
    String? email,
    String? nome,
    String? telefone,
    String? dataNascimento,
    String? imagem,
    ChurchModel? igreja,
    AddressModel? endereco,
  }) {
    return UserModel(
      id: id ?? this.id,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
      email: email ?? this.email,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      imagem: imagem ?? this.imagem,
      igreja: igreja ?? this.igreja,
      endereco: endereco ?? this.endereco,
    );
  }

}