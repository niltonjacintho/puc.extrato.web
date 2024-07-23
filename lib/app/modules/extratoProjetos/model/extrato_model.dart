class ExtratoModel {
  int? linha;
  int? id;
  String? projeto;
  String? nome;
  String? fatura;
  String? data;
  String? texto;
  double? receita;
  double? despesa;
  double? saldo;
  int? valor;

  ExtratoModel(
      {this.linha,
      this.id,
      this.projeto,
      this.nome,
      this.fatura,
      this.data,
      this.texto,
      this.receita,
      this.despesa,
      this.saldo,
      this.valor});

  ExtratoModel.fromJson(Map<String, dynamic> json) {
    linha = json['linha'];
    id = json['id'];
    projeto = json['projeto'];
    nome = json['nome'];
    fatura = json['fatura'];
    data = json['data'];
    texto = json['texto'];
    receita = json['receita'];
    despesa = json['despesa'];
    saldo = json['saldo'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linha'] = linha;
    data['id'] = id;
    data['projeto'] = projeto;
    data['nome'] = nome;
    data['fatura'] = fatura;
    data['data'] = this.data;
    data['texto'] = texto;
    data['receita'] = receita;
    data['despesa'] = despesa;
    data['saldo'] = saldo;
    data['valor'] = valor;
    return data;
  }
}
