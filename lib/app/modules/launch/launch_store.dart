import 'package:mobx/mobx.dart';
import 'package:laserfast_app/app/models/hives/app_presentation.hive.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';

part 'launch_store.g.dart';

class LaunchStore = LaunchStoreBase with _$LaunchStore;

abstract class LaunchStoreBase with Store {
  //CONSTS

  //APIS

  //SERVICES
  final LoginHive _loginHive = LoginHive();
  final AppPresentationHive _appPresentationHive = AppPresentationHive();

  //STORES

  //OBSERVABLES
  @observable
  bool usingAppForFirstTime = true;
  @observable
  int presentationIndex = 0;

  //ACTIONS
  @action
  void checkShowPresentation() {
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
