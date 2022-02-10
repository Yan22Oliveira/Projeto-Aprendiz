class AnnouncementsModel {

  int? id;
  final String title;
  final String subTitle;
  final String mensagem;
  final String dataCadastro;

  AnnouncementsModel({
    this.id,
    required this.title,
    required this.subTitle,
    required this.mensagem,
    required this.dataCadastro,
  });

  AnnouncementsModel copyWith({
    int? id,
    String? title,
    String? subTitle,
    String? mensagem,
    String? dataCadastro,
  }) {
    return AnnouncementsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      mensagem: mensagem ?? this.mensagem,
      dataCadastro: dataCadastro ?? this.dataCadastro,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':           id,
      'title':        title,
      'subTitle':     subTitle,
      'mensagem':     mensagem,
      'dataCadastro': dataCadastro,
    };
  }

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementsModel(
      id:           json['id'],
      title:        json['title'],
      subTitle:     json['subTitle'],
      mensagem:     json['mensagem'],
      dataCadastro: json['dataCadastro'],
    );
  }
  factory AnnouncementsModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementsModel(
      id:           map['id'],
      title:        map['title'],
      subTitle:     map['subTitle'],
      mensagem:     map['mensagem'],
      dataCadastro: map['dataCadastro'],
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AnnouncementsModel &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              subTitle == other.subTitle &&
              mensagem == other.mensagem);

  @override
  int get hashCode => title.hashCode ^ subTitle.hashCode ^ mensagem.hashCode;

  @override
  String toString() {
    return 'AnnouncementsModel{'
        ' id: $id,'
        ' title: $title,'
        ' subTitle: $subTitle,'
        ' mensagem: $mensagem,'
        ' dataCadastro: $dataCadastro,'
        '}';
  }

}