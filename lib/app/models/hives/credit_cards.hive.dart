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

  Future<CreditCardModel?> findCard(int id) async {
    return (await getCards()).where((c) => c.id == id).firstOrNull;
  }

  Future<bool> saveCard(CreditCardModel card) async {
    var cards = await getCards();

    int index = cards.indexWhere((c) => c.id == card.id);

    if (index == -1) {
      card.id = cards.length + 1;
      cards.add(card);
    } else {
      cards[index] = card;
    }

    try {
      await Hive.box('credit_cards').put('cards', cards);
      return true;
    } catch (_) {
      return false;
    }
  }

  bool hasCards() {
    return Hive.box('credit_cards').containsKey('cards');
  }
}
