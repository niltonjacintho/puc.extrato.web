class CoordenadorModel {
  int? coordenador;
  String? nome;
  String? email;

  CoordenadorModel({this.coordenador, this.nome, this.email});

  CoordenadorModel.fromJson(Map<String, dynamic> json) {
    coordenador = json['coordenador'];
    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordenador'] = coordenador;
    data['nome'] = nome;
    data['email'] = email;
    return data;
  }
}
