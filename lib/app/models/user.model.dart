import 'package:compregados_app_v2/app/models/ad.model.dart';

import 'abstract/from_json.abstract.dart';

class UserModel extends FromJsonModel {
  int? userId;
  String? uuid;
  String? name;
  DateTime? birthday;
  String? email;
  String? cpf;
  String? role;
  String? code;
  String? phone;
  String? password;
  bool? isVerified;
  DateTime? createdAt;
  List<AdModel>? ads;
  String? photo;

  UserModel({
    this.userId,
    this.uuid,
    this.name,
    this.birthday,
    this.email,
    this.cpf,
    this.role,
    this.code,
    this.phone,
    this.password,
    this.isVerified,
    this.ads,
    this.photo,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    uuid = json['uuid'];
    name = json['name'];
    if (json['birthday'] != null) {
      birthday = DateTime.tryParse(json['birthday']);
    }
    email = json['email'];
    cpf = json['cpf'];
    role = json['role'];
    code = json['code'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    photo = json['photo'];
    createdAt = DateTime.tryParse(json['created_at']);
    if (json['ads'] != null) {
      ads = <AdModel>[];
      json['ads'].forEach((v) {
        ads!.add(AdModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['uuid'] = uuid;
    data['name'] = name;
    data['birthday'] = birthday;
    data['email'] = email;
    data['cpf'] = cpf;
    data['role'] = role;
    data['code'] = code;
    data['phone'] = phone;
    data['password'] = password;
    data['is_verified'] = isVerified;
    data['photo'] = photo;

    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);
}
