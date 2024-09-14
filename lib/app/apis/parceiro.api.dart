import 'package:laserfast_app/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:laserfast_app/app/models/parceiro.model.dart';
import 'base.api.dart';

class ParceiroApi extends BaseApi {
  Future<BaseModel<ParceiroModel>> parceiros() async {
    var b = BaseModel<ParceiroModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/app/Parceiros';
      final Map<String, dynamic> q = {"cpf": cpf};

      var result = (await (await dio).get(url, queryParameters: q)).data;

      b = BaseModel.fromJson(result, tipo: ParceiroModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
