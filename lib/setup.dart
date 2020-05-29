import 'package:easy_i18n/easy_i18n.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:screens/screens.dart';
import 'package:wepody/helpers/navigator_helper.dart';
import 'package:wepody/models/config_model.dart';
import 'package:wepody/services/config_service.dart';
import 'package:wepody/style/theme.dart';

class SetUp {
  final ConfigModel configModel;

  SetUp({this.configModel});

  static resgisterI18n(EasyI18n easyI18n) {
    GetIt.I.registerLazySingleton<EasyI18n>(
      () => easyI18n,
    );
  }

  _initConfig() async {
    final configService = ConfigService();

    await configService.init();

    final _configModel = configModel ?? await configService.getConfigs();

    GetIt.I.registerLazySingleton<ConfigService>(() => ConfigService());
    GetIt.I.registerLazySingleton<ConfigModel>(() => _configModel);
  }

  _initInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    GetIt.I.registerLazySingleton<PackageInfo>(() => packageInfo);
  }

  _initHelpers() {
    GetIt.I.registerLazySingleton<NavigatorHelper>(() => NavigatorHelper());
  }

  _initServices() {}

  _initStores() async {
    // final configStore = ConfigStore();

    // await configStore.init(configModel);

    // GetIt.I.registerLazySingleton<ConfigStore>(() => configStore);
  }

  _initScreens() {
    GetIt.I.registerLazySingleton<Screens>(() => Screens());
  }

  _initTheme() {
    GetIt.I.registerLazySingleton<StyleTheme>(() => StyleTheme());
  }

  init() async {
    await _initInfo();
    await _initConfig();

    _initHelpers();
    _initServices();

    await _initStores();

    _initTheme();

    _initScreens();
  }
}
