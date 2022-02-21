class InformacaoModel {

  int? id;
  String? texto;
  String? subTexto;
  bool? status;
  bool? ativo;

  InformacaoModel({
    this.id,
    this.texto,
    this.subTexto,
    this.status,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':       id,
      'texto':    texto,
      'subTexto': subTexto,
      'status':   status,
    };
  }

  factory InformacaoModel.fromMap(Map<String, dynamic> map) {
    return InformacaoModel(
      id:       map['id'],
      texto:    map['texto'],
      subTexto: map['subTexto'],
      status:   map['status'],
      ativo:    map['ativo'],
    );
  }

  factory InformacaoModel.fromJson(Map<String, dynamic> json) {
    return InformacaoModel(
      id:       json['id'],
      texto:    json['texto'],
      subTexto: json['subTexto'],
      status:   json['status'],
      ativo:    json['ativo']??false,
    );
  }



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is InformacaoModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              texto == other.texto &&
              subTexto == other.subTexto &&
              status == other.status);

  @override
  int get hashCode =>
      id.hashCode ^ texto.hashCode ^ subTexto.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'InformacaoModel{'
        ' id: $id,'
        ' texto: $texto,'
        ' subTexto: $subTexto,'
        ' status: $status,'
        '}';
  }

  InformacaoModel copyWith({
    int? id,
    String? texto,
    String? subTexto,
    bool? status,
  }) {
    return InformacaoModel(
      id: id ?? this.id,
      texto: texto ?? this.texto,
      subTexto: subTexto ?? this.subTexto,
      status: status ?? this.status,
    );
  }

}