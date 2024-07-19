import 'package:laserfast_app/app/constants/constants.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/dtos/can_create_ad.dto.dart';
import 'package:laserfast_app/app/models/user.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'base.api.dart';

class UserApi extends BaseApi {
  get _option => BaseOptions(baseUrl: API_URL);

  Future<BaseModel<AuthModel>> create(UserModel userModel, XFile? file) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      var d = Dio(_option);
      if (kDebugMode) {
        d.interceptors.addAll([
          PrettyDioLogger(
            request: true,
            requestBody: true,
            responseBody: true,
            error: true,
          )
        ]);
      }

      final formData = FormData.fromMap(userModel.toJson());

      if (file != null) {
        formData.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(file.path, filename: file.name),
        ));
      }

      var result = (await d.post('user', data: formData)).data;

      b = BaseModel.fromJson(result, tipo: AuthModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<UserModel>> find() async {
    BaseModel<UserModel> b = BaseModel<UserModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }
      var result = (await (await dio).get('user/find')).data;
      b = BaseModel.fromJson(result, tipo: UserModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<UserModel>> findByUuid(String uuid) async {
    BaseModel<UserModel> b = BaseModel<UserModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }
      var result = (await (await dio).get('user/findby/$uuid')).data;
      b = BaseModel.fromJson(result, tipo: UserModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<UserModel>> getLoggedUserWithAddress() async {
    BaseModel<UserModel> b = BaseModel<UserModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).get('ad/getLoggedUserWithAddress')).data;
      return BaseModel.fromJson(result, tipo: UserModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<CanCreateAdDto>> canCreateAds() async {
    BaseModel<CanCreateAdDto> b = BaseModel<CanCreateAdDto>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).get('user/canCreateAds')).data;
      b = BaseModel.fromJson(result, tipo: CanCreateAdDto());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<dynamic>> remove() async {
    BaseModel<dynamic> b = BaseModel();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).delete('user/')).data;
      b = BaseModel.fromJson(result);
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
