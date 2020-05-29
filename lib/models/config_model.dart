import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:version/version.dart';

class ConfigModel {
  final String env;
  final bool isUpdated;

  ConfigModel({
    @required this.env,
    @required this.isUpdated,
  })  : assert(env != null),
        assert(isUpdated != null);

  factory ConfigModel.fromRemoteConfig(RemoteConfig remoteConfig) =>
      ConfigModel(
        env: remoteConfig.getString('env'),
        isUpdated: Version.parse(GetIt.I<PackageInfo>().version) >=
            Version.parse(remoteConfig.getString('minVersion')),
      );
}
