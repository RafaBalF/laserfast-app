import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:laserfast_app/app/constants/constants.dart';
import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:laserfast_app/app/models/string_response.model.dart';
import 'base.api.dart';

class AuthApi extends BaseApi {
  get _baseUrl => API_URL;
  get _option => BaseOptions(baseUrl: _baseUrl);
  final LoginHive _loginHive = LoginHive();

  Future<BaseModel<AuthModel>> login(String login, String password) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var result = (await Dio(_option).post(
        '/Login/ValidarLogin',
        data: {
          "cpf": login,
          "senha": password,
        },
      ))
          .data;

      b = BaseModel<AuthModel>.fromJson(result, tipo: AuthModel());

      if (b.status && b.result != null) {
        AuthModel authModel = AuthModel(
          token: b.result!.token,
          name: b.result!.name,
          uuid: b.result!.uuid,
        );

        await _loginHive.setLogin(authModel);
        return b;
      }
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<AuthModel>> cadastrarLogin(String cpf, String senha) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var result = (await Dio(_option).post(
        '/Login/CadastrarLogin',
        data: {
          "cpf": cpf,
          "senha": senha,
        },
      ))
          .data;

      b = BaseModel<AuthModel>.fromJson(result, tipo: AuthModel());

      if (b.status && b.result != null) {
        AuthModel authModel = AuthModel(
          token: b.result!.token,
          cpf: b.result!.cpf,
          uuid: b.result!.uuid,
        );

        await _loginHive.setLogin(authModel);
        return b;
      }
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<StringResponseModel>> resendSMS(String user,
      {bool isID = true}) async {
    BaseModel<StringResponseModel> b = BaseModel<StringResponseModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio)
              .get('/auth/resend-sms/$user', queryParameters: {'is_id': true}))
          .data;

      b = BaseModel<StringResponseModel>.fromJson(result,
          tipo: StringResponseModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<AuthModel>> confirmCode(String user, String code) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).post('/auth/confirm_code', data: {
        "email": user,
        "code": code,
      }))
          .data;

      b = BaseModel<AuthModel>.fromJson(result, tipo: AuthModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<StringResponseModel>> forgetPassword(String? email) async {
    BaseModel<StringResponseModel> b = BaseModel<StringResponseModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).get('/auth/forget-password/$email')).data;

      b = BaseModel<StringResponseModel>.fromJson(result,
          tipo: StringResponseModel());
    } on DioException catch (e) {
      b.message = handleError(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
