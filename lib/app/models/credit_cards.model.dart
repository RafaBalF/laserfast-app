import 'package:hive/hive.dart';

import 'abstract/from_json.abstract.dart';

part 'credit_cards.model.g.dart';

@HiveType(typeId: 1)
class CreditCardsModel extends FromJsonModel {
  @HiveField(0)
  List<CreditCardsModel>? cards;

  CreditCardsModel({
    this.cards,
  });

  CreditCardsModel.fromJson(Map<String, dynamic> json) {
    cards = [];

    if (json['cards'] != null) {
      for (var card in json['cards']) {
        cards!.add(CreditCardsModel.fromJson(card));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    return json;
  }

  @override
  fromJson(Map<String, dynamic> json) => CreditCardsModel.fromJson(json);
}
