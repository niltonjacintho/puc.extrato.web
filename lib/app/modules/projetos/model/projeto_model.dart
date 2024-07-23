class ProjetoModel {
  final int? codigo;
  final String? projeto;
  final String? descricao;
  final int? coordenador;
  final String? contaPrincipal;
  final String? tipoProjeto;
  const ProjetoModel(
      {this.codigo,
      this.projeto,
      this.descricao,
      this.coordenador,
      this.contaPrincipal,
      this.tipoProjeto});
  ProjetoModel copyWith(
      {int? codigo,
      String? projeto,
      String? descricao,
      int? coordenador,
      String? contaPrincipal,
      String? tipoProjeto}) {
    return ProjetoModel(
        codigo: codigo ?? this.codigo,
        projeto: projeto ?? this.projeto,
        descricao: descricao ?? this.descricao,
        coordenador: coordenador ?? this.coordenador,
        contaPrincipal: contaPrincipal ?? this.contaPrincipal,
        tipoProjeto: tipoProjeto ?? this.tipoProjeto);
  }

  Map<String, Object?> toJson() {
    return {
      'codigo': codigo,
      'projeto': projeto,
      'descricao': descricao,
      'coordenador': coordenador,
      'conta_principal': contaPrincipal,
      'tipo_projeto': tipoProjeto
    };
  }

  static ProjetoModel fromJson(Map<String, Object?> json) {
    return ProjetoModel(
        codigo: json['codigo'] == null ? null : json['codigo'] as int,
        projeto: json['projeto'] == null ? null : json['projeto'] as String,
        descricao:
            json['descricao'] == null ? null : json['descricao'] as String,
        coordenador:
            json['coordenador'] == null ? null : json['coordenador'] as int,
        contaPrincipal: json['conta_principal'] == null
            ? null
            : json['conta_principal'] as String,
        tipoProjeto: json['tipo_projeto'] == null
            ? null
            : json['tipo_projeto'] as String);
  }

  @override
  String toString() {
    return '''ProjetoModel(
                codigo:$codigo,
projeto:$projeto,
descricao:$descricao,
coordenador:$coordenador,
contaPrincipal:$contaPrincipal,
tipoProjeto:$tipoProjeto
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProjetoModel &&
        other.runtimeType == runtimeType &&
        other.codigo == codigo &&
        other.projeto == projeto &&
        other.descricao == descricao &&
        other.coordenador == coordenador &&
        other.contaPrincipal == contaPrincipal &&
        other.tipoProjeto == tipoProjeto;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, codigo, projeto, descricao, coordenador,
        contaPrincipal, tipoProjeto);
  }
}
