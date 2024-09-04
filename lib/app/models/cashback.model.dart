import 'abstract/from_json.abstract.dart';

class CashbackModel extends FromJsonModel {
  double? valor;

  CashbackModel({
    this.valor,
  });

  CashbackModel.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => CashbackModel.fromJson(json);
}
