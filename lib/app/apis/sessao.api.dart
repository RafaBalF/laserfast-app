import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/comanda.model.dart';
import 'package:laserfast_app/app/models/contrato.model.dart';
import 'package:laserfast_app/app/models/sessao.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class SessaoApi extends BaseApi {
  Future<BaseModel<SessaoModel>> listarHistoricoUltimasSessoes() async {
    var b = BaseModel<SessaoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Historico/ListarHistoricoUltimasSessoes/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: SessaoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<ContratoModel>> listarContratos() async {
    var b = BaseModel<ContratoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Contratos/ListarContratos/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: ContratoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<ComandaModel>>
      listarComandasComSessoesDisponiveisPorCPF() async {
    var b = BaseModel<ComandaModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Agendamento/ListarComandasComSessoesDisponiveisPorCPF/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: ComandaModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
