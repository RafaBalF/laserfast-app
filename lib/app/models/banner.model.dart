import 'abstract/from_json.abstract.dart';

class BannerModel extends FromJsonModel {
  // TODO: implementar banners quando tiver algum

  BannerModel();

  BannerModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => BannerModel.fromJson(json);
}
