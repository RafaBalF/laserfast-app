import 'package:laserfast_app/app/apis/apresentacao.api.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/app/models/hives/app_presentation.hive.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'launch_store.g.dart';

class LaunchStore = LaunchStoreBase with _$LaunchStore;

abstract class LaunchStoreBase with Store {
  //CONSTS

  //APIS

  //SERVICES
  final LoginHive _loginHive = LoginHive();
  final AppPresentationHive _appPresentationHive = AppPresentationHive();
  final ApresentacaoApi _apresentacaoApi = ApresentacaoApi();

  //STORES

  //OBSERVABLES
  @observable
  bool usingAppForFirstTime = true;
  @observable
  int presentationIndex = 0;
  @observable
  String? presentationImage;

  @observable
  bool checkForUpdates = true;
  @observable
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  @observable
  bool shouldUpdate = false;
  @observable
  String version = "1.0.0";
  @observable
  bool obligatory = false;

  //ACTIONS
  @action
  Future<void> getAppVersion() async {
    // String platform = (Platform.isAndroid) ? 'android' : 'ios';
    packageInfo = await PackageInfo.fromPlatform();

    version = "1.0.0";
    obligatory = false;

    int currentVersion = int.parse(packageInfo.version.replaceAll('.', ''));
    int newVersion = int.parse(version.replaceAll('.', ''));

    shouldUpdate = (currentVersion < newVersion);
  }

  @action
  Future<void> getPresentationImage() async {
    final r = await _apresentacaoApi.apresentacao();

    if (!r.success) return;

    presentationImage = r.list?.first.imagem;
  }

  @action
  void ignoreUpdates() => checkForUpdates = false;

  @action
  Future<void> checkShowPresentation() async {
    if (_shouldSkipPresentation()) {
      usingAppForFirstTime = false;
    }
  }

  @action
  void incrementPresentationIndex({int index = 1}) {
    presentationIndex += index;
    if (presentationIndex > 2) {
      presentationIndex = 2;
    }
  }

  @action
  Future<void> setHasSeenAppPresentationBefore() async {
    await _appPresentationHive.setHasSeenAppPresentationBefore(true);
  }

  //METHODS
  bool _shouldSkipPresentation() {
    return _loginHive.isLogged() ||
        _appPresentationHive.hasSeenAppPresentationBefore();
  }

  bool isLogged() {
    return _loginHive.isLogged();
  }
}
