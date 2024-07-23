class SaldoProjetoModel {
  int? codigoProjeto;
  String? nomeProjeto;
  String? conta;
  String? descricao;
  double? saldo;

  SaldoProjetoModel(
      {this.codigoProjeto,
      this.nomeProjeto,
      this.conta,
      this.descricao,
      this.saldo});

  SaldoProjetoModel.fromJson(Map<String, dynamic> json) {
    codigoProjeto = json['codigo_projeto'];
    nomeProjeto = json['nomeProjeto'];
    conta = json['conta'];
    descricao = json['descricao'];
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo_projeto'] = codigoProjeto;
    data['nomeProjeto'] = nomeProjeto;
    data['conta'] = conta;
    data['descricao'] = descricao;
    data['saldo'] = saldo;
    return data;
  }
}
