import 'package:laserfast_app/app/models/base.model.dart';
import 'package:laserfast_app/app/models/comanda.model.dart';
import 'package:laserfast_app/app/models/contrato.model.dart';
import 'package:laserfast_app/app/models/horarios_disponiveis_com_opcoes.model.dart';
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

  Future<BaseModel<HorariosDisponiveisComOpcoesModel>>
      listarHorariosDisponiveisComOpcoes(
    int codigoUnidade,
    int tempoSessaoTotal,
    DateTime dataInicial,
    DateTime dataFinal,
  ) async {
    var b = BaseModel<HorariosDisponiveisComOpcoesModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      // BuscaPorComanda: enviar sempre FALSE
      // CodigoUnidade: código da unidade em que o(a) cliente quer agendar as sessões
      // CodigoComanda: enviar sempre NULL
      // Periodo: valores aceitáveis - “MANHA”, “TARDE”, “NOITE” ou VAZIO (“”)
      // DiaSemana: vazio ou “X” para considerar todos os dias da semana. Para selecionar dias específicos, enviar uma única STRING com os números do dia da semana separados por PIPE (“|”).
      // Números dos dias da semana: 0 – Domingo, 1 – Segunda, 2 – Terça, 3 – Quarta, 4 – Quinta, 5 – Sexta, 6 – Sábado.
      // Exemplo selecionando Segunda, Terça e Quarta: “1|2|3”
      // TempoSessaoTotal: soma do tempo de sessão dos itens selecionados pelo(a) cliente
      // DataInicial: data do início da busca de horários. A hora é ignorada (sempre considera 00:00:00)
      // DataFinal: data de término da busca de horários. A hora é ignorada (sempre considera 23:59:59). O limite da DataFinal é 45 dias. Caso seja feita uma requisição em que o período entre a DataInicial e a DataFinal seja superior a 45 dias, será apresentado um erro.
      // LimiteHorarios: NULL para exibir todos os horários disponíveis no período selecionado. Um número inteiro limita a quantidade de horários que serão retornados a partir do primeiro horário disponível. Por exemplo, “LimiteHorarios: 10” trará os 10 primeiros horários disponíveis.

      const url = '/Agendamento/ListarHorariosDisponiveisComOpcoesPost';
      const limite = 50;

      var result = (await (await dio).post(url, data: {
        "buscaPorComanda": false,
        "codigoUnidade": codigoUnidade,
        "codigoComanda": null,
        "periodo": "",
        "diaSemana": "X",
        "tempoSessaoTotal": tempoSessaoTotal,
        "dataInicial": dataInicial.toString(),
        "dataFinal": dataFinal.toString(),
        "limiteHorarios": limite,
      }))
          .data;

      b = BaseModel.fromJson(result, tipo: HorariosDisponiveisComOpcoesModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
