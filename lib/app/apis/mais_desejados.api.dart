import 'package:laserfast_app/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:laserfast_app/app/models/mais_desejado.model.dart';
import 'base.api.dart';

class MaisDesejadosApi extends BaseApi {
  Future<BaseModel<MaisDesejadoModel>> maisDesejados() async {
    var b = BaseModel<MaisDesejadoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/app/MaisDesejados';
      final Map<String, dynamic> q = {"cpf": cpf};

      var result = (await (await dio).get(url, queryParameters: q)).data;

      b = BaseModel.fromJson(result, tipo: MaisDesejadoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
