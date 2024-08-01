import 'package:hive/hive.dart';
import 'package:laserfast_app/app/models/credit_card.model.dart';

class CreditCardsHive {
  Future<bool> boxExists() async {
    return await Hive.boxExists('credit_cards');
  }

  //guests
  Future<List<CreditCardModel>> getCards() async {
    return await Hive.box('credit_cards').get('cards') ?? [];
  }

  Future<void> saveCard(CreditCardModel card) async {
    var cards = await getCards();

    int index = cards.indexWhere((c) => c.id == card.id);

    (index == -1) ? cards.add(card) : cards[index] = card;

    return await Hive.box('credit_cards').put('cards', cards);
  }

  bool hasCards() {
    return Hive.box('credit_cards').containsKey('cards');
  }
}
