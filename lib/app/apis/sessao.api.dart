import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/session.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class SessaoApi extends BaseApi {
  Future<BaseModel<SessionModel>> listarHistoricoUltimasSessoes() async {
    var b = BaseModel<SessionModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Historico/ListarHistoricoUltimasSessoes/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: SessionModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
