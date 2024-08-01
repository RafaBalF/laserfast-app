import 'abstract/from_json.abstract.dart';

class CreditCardModel extends FromJsonModel {
  int? id;
  String? numero;
  String? nome;
  String? dataVencimento;
  String? cvc;

  CreditCardModel({
    this.id,
    this.numero,
    this.nome,
    this.dataVencimento,
    this.cvc,
  });

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    nome = json['nome'];
    dataVencimento = json['dataVencimento'];
    cvc = json['cvc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['id'] = id;
    json['numero'] = numero;
    json['nome'] = nome;
    json['dataVencimento'] = dataVencimento;
    json['cvc'] = cvc;

    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CreditCardModel.fromJson(json);
}
