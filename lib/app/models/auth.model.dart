import 'package:hive/hive.dart';

import 'abstract/from_json.abstract.dart';

part 'auth.model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends FromJsonModel {
  @HiveField(0)
  String? uuid;
  @HiveField(1)
  String? token;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? cpf;

  AuthModel.uuid({this.uuid});

  AuthModel({this.token, this.name, this.uuid, this.cpf});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    uuid = json['uuid'];
    name = json['name'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['uuid'] = uuid;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AuthModel.fromJson(json);
}
