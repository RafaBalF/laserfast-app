import 'package:laserfast_app/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:laserfast_app/app/models/imagem_apresentacao.model.dart';
import 'base.api.dart';

class ApresentacaoApi extends BaseApi {
  Future<BaseModel<ImagemApresentacaoModel>> apresentacao() async {
    var b = BaseModel<ImagemApresentacaoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/app/Apresentacao';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(
        result,
        tipo: ImagemApresentacaoModel(),
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
