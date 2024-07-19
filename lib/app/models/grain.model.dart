import 'package:laserfast_app/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class GrainModel extends FromJsonModel {
  int? grainId;
  String? uuid;
  String? grainType;
  double? weight;

  GrainModel({this.grainId, this.uuid, this.grainType, this.weight});

  GrainModel.fromJson(Map<String, dynamic> json) {
    grainId = json['grain_id'];
    uuid = json['uuid'];
    grainType = json['grain_type'];
    weight = convertDouble(json['weight']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grain_id'] = grainId;
    data['uuid'] = uuid;
    data['grain_type'] = grainType;
    data['weight'] = weight;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => GrainModel.fromJson(json);
}
