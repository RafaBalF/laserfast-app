import 'package:laserfast_app/app/models/abstract/from_json.abstract.dart';
import 'package:laserfast_app/app/models/user.model.dart';

class LoginModel extends FromJsonModel {
  String? token;
  UserModel? user;

  LoginModel({
    this.token,
    this.user,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => LoginModel.fromJson(json);
}
