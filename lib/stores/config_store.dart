// import 'package:mobx/mobx.dart';
// import 'package:package_info/package_info.dart';
// import 'package:version/version.dart';
// import 'package:wepody/model/config_model.dart';

// part 'config_store.g.dart';

// class ConfigStore = _ConfigStoreBase with _$ConfigStore;

// abstract class _ConfigStoreBase with Store {
//   @observable
//   Version minVersion;

//   @action
//   setMinVersion(Version value) => minVersion = value;

//   @observable
//   Version currentVersion;

//   @action
//   setCurrentVersion() async {
//     final packageInfo = await PackageInfo.fromPlatform();

//     currentVersion = Version.parse(packageInfo.version);
//   }

//   @computed
//   bool get isUpdated => currentVersion >= minVersion;

//   @action
//   init(ConfigModel configModel) async {
//     // setMinVersion(configModel.minVersion);
//     await setCurrentVersion();
//   }
// }
