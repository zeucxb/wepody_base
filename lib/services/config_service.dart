import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:wepody/models/config_model.dart';

class ConfigService {
  RemoteConfig remoteConfig;

  init() async {
    remoteConfig = await RemoteConfig.instance;

    final defaults = <String, dynamic>{
      'env': 'prod',
      'minVersion': '1.0.0',
    };
    await remoteConfig.setDefaults(defaults);

    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();
  }

  Future<ConfigModel> getConfigs() async {
    return ConfigModel.fromRemoteConfig(remoteConfig);
  }
}
