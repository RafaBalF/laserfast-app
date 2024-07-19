import 'abstract/from_json.abstract.dart';

class AnimalModel extends FromJsonModel {
  int? animalId;
  String? uuid;
  String? weight;
  int? amount;
  int? ageId;
  String? age;
  String? race;
  String? coat;
  String? fitness;
  String? milk;
  String? andrology;
  double? weightPerHead;

  AnimalModel({
    this.animalId,
    this.uuid,
    this.weight,
    this.amount,
    this.ageId,
    this.age,
    this.race,
    this.coat,
    this.fitness,
    this.milk,
    this.andrology,
    this.weightPerHead,
  });

  AnimalModel.fromJson(Map<String, dynamic> json) {
    animalId = json['animal_id'];
    uuid = json['uuid'];
    weight = json['weight'];
    amount = json['amount'];
    ageId = json['age_id'];
    age = json['age'];
    race = json['race'];
    coat = json['coat'];
    fitness = json['fitness'];
    milk = json['milk'];
    andrology = json['andrology'];
    if (json['weight_per_head'] != null) {
      weightPerHead = double.parse(json['weight_per_head'].toString());
    } else {
      weightPerHead = 0.0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['animal_id'] = animalId;
    data['uuid'] = uuid;
    data['weight'] = weight;
    data['amount'] = amount;
    data['age_id'] = ageId;
    data['age'] = age;
    data['race'] = race;
    data['coat'] = coat;
    data['fitness'] = fitness;
    data['milk'] = milk;
    data['andrology'] = andrology;
    data['weight_per_head'] = weightPerHead;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AnimalModel.fromJson(json);
}
