import 'abstract/from_json.abstract.dart';

class PropertyModel extends FromJsonModel {
  int? propertyId;
  String? uuid;
  String? propertySaleType;

  PropertyModel({this.propertyId, this.uuid, this.propertySaleType});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    uuid = json['uuid'];
    propertySaleType = json['property_sale_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_id'] = propertyId;
    data['uuid'] = uuid;
    data['property_sale_type'] = propertySaleType;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => PropertyModel.fromJson(json);
}
