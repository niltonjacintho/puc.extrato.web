class ContasModel {
  final String? conta;
  final String? contaMae;
  final String? descricao;
  final String? descricaoBase;
  const ContasModel(
      {this.conta, this.contaMae, this.descricao, this.descricaoBase});
  ContasModel copyWith(
      {String? conta,
      String? contaMae,
      String? descricao,
      String? descricaoBase}) {
    return ContasModel(
        conta: conta ?? this.conta,
        contaMae: contaMae ?? this.contaMae,
        descricao: descricao ?? this.descricao,
        descricaoBase: descricaoBase ?? this.descricaoBase);
  }

  Map<String, Object?> toJson() {
    return {
      'conta': conta,
      'contaMae': contaMae,
      'descricao': descricao,
      'descricaoBase': descricaoBase
    };
  }

  static ContasModel fromJson(Map<String, Object?> json) {
    return ContasModel(
        conta: json['conta'] == null ? null : json['conta'] as String,
        contaMae: json['contaMae'] == null ? null : json['contaMae'] as String,
        descricao:
            json['descricao'] == null ? null : json['descricao'] as String,
        descricaoBase: json['descricaoBase'] == null
            ? null
            : json['descricaoBase'] as String);
  }

  @override
  String toString() {
    return '''ContasModel(
                conta:$conta,
contaMae:$contaMae,
descricao:$descricao,
descricaoBase:$descricaoBase
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ContasModel &&
        other.runtimeType == runtimeType &&
        other.conta == conta &&
        other.contaMae == contaMae &&
        other.descricao == descricao &&
        other.descricaoBase == descricaoBase;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, conta, contaMae, descricao, descricaoBase);
  }
}
