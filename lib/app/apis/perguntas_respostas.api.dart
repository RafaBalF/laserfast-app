import 'package:laserfast_app/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:laserfast_app/app/models/perguntas_respostas.model.dart';
import 'base.api.dart';

class PerguntasRespostasApi extends BaseApi {
  Future<BaseModel<PerguntasRespostasModel>> perguntasRespostas() async {
    var b = BaseModel<PerguntasRespostasModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/app/PerguntasRespostas';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(
        result,
        tipo: PerguntasRespostasModel(),
        isList: true,
      );
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
