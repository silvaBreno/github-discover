import 'package:github_discover/src/config/environment/env_debug.dart';

import 'app_env_fields.dart';

abstract class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static const AppEnv _instance = EnvDebug();
}
