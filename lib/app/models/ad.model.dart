import 'package:compregados_app_v2/app/models/abstract/from_json.abstract.dart';
import 'package:compregados_app_v2/app/models/animal.model.dart';
import 'package:compregados_app_v2/app/models/file.model.dart';
import 'package:compregados_app_v2/app/models/grain.model.dart';
import 'package:compregados_app_v2/app/models/property.model.dart';
import 'package:compregados_app_v2/app/shared/convert.dart';

class AdModel extends FromJsonModel {
  int? adId;
  String? uuid;
  String? title;
  String? description;
  double? price;
  int? userId;
  int? siloId;
  int? animalId;
  int? categoryId;
  String? category;
  int? vehicleId;
  int? machineId;
  String? franchise;
  String? adType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? freightId;
  int? grainId;
  int? propertyId;
  String? state;
  String? city;
  String? link;
  String? photoMobile;
  String? photoWeb;
  late bool isBannerAd;
  String? adUuid;
  DateTime? soldAt;
  List<FileModel>? files;
  AnimalModel? animal;
  PropertyModel? property;
  GrainModel? grain;
  bool? soldInApp;
  int? clickAmount;

  AdModel({
    this.adId,
    this.uuid,
    this.title,
    this.description,
    this.price,
    this.userId,
    this.siloId,
    this.animalId,
    this.categoryId,
    this.category,
    this.vehicleId,
    this.machineId,
    this.franchise,
    this.adType,
    this.createdAt,
    this.updatedAt,
    this.freightId,
    this.grainId,
    this.propertyId,
    this.soldAt,
    this.state,
    this.city,
    this.link,
    this.photoMobile,
    this.photoWeb,
    this.isBannerAd = false,
    this.adUuid,
    this.files,
    this.animal,
    this.property,
    this.grain,
    this.soldInApp,
    this.clickAmount,
  });

  AdModel.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    price = double.tryParse(json['price'].toString());
    userId = json['user_id'];
    siloId = json['silo_id'];
    animalId = json['animal_id'];
    categoryId = json['category_id'];
    category = json['category'];
    if (json['animal'] != null) {
      animal = AnimalModel.fromJson(json['animal']);
    }
    if (json['property'] != null) {
      property = PropertyModel.fromJson(json['property']);
    }
    if (json['grain'] != null) {
      grain = GrainModel.fromJson(json['grain']);
    }
    vehicleId = json['vehicle_id'];
    machineId = json['machine_id'];
    franchise = json['franchise'];
    state = json['state'];
    city = json['city'];
    adType = json['ad_type'];
    link = json['link'];
    photoMobile = json['photo_mobile'];
    photoWeb = json['photo_web'];
    isBannerAd = convertBool(json['is_banner_ad'], returnNull: false)!;
    adUuid = json['ad_uuid'];
    createdAt = convertDateTime(json['created_at']);
    updatedAt = json['updated_at'] != null
        ? DateTime.tryParse(json['updated_at'])
        : null;
    freightId = json['freight_id'];
    grainId = json['grain_id'];
    propertyId = json['property_id'];
    soldAt =
        json['sold_at'] != null ? DateTime.tryParse(json['sold_at']) : null;
    if (json['files'] != null) {
      files = <FileModel>[];
      json['files'].forEach((v) {
        files!.add(FileModel.fromJson(v));
      });
    }
    soldInApp = json['sold_in_app'];
    clickAmount =
        json['click_amount'] != null ? int.tryParse(json['click_amount']) : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_id'] = adId;
    data['uuid'] = uuid;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['user_id'] = userId;
    data['silo_id'] = siloId;
    data['animal_id'] = animalId;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['vehicle_id'] = vehicleId;
    data['machine_id'] = machineId;
    data['franchise'] = franchise;
    data['ad_type'] = adType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['freight_id'] = freightId;
    data['grain_id'] = grainId;
    data['property_id'] = propertyId;
    data['state'] = state;
    data['city'] = city;
    data['link'] = link;
    data['photo_mobile'] = photoMobile;
    data['photo_web'] = photoWeb;
    data['is_bannerAd'] = isBannerAd;
    data['ad_uuid'] = adUuid;
    data['sold_at'] = soldAt;
    data['animal'] = animal;
    data['property'] = property;
    data['grain'] = grain;
    data['sold_in_app'] = soldInApp;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AdModel.fromJson(json);
}
