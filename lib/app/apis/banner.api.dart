import 'package:laserfast_app/app/models/banner.model.dart';
import 'package:laserfast_app/app/models/banner_vertical.model.dart';
import 'package:laserfast_app/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class BannerApi extends BaseApi {
  Future<BaseModel<BannerModel>> listarBannersAplicativo() async {
    var b = BaseModel<BannerModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Banner/ListarBannersAplicativo';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: BannerModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<BannerVerticalModel>> bannerVertical() async {
    var b = BaseModel<BannerVerticalModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/app/BannerVertical';
      final Map<String, dynamic> q = {"cpf": cpf};

      var result = (await (await dio).get(url, queryParameters: q)).data;

      b = BaseModel.fromJson(result, tipo: BannerVerticalModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
