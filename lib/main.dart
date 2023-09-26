import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';
import 'package:github_discover/src/app.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Hive.initFlutter();

  startModules();
  await GetIt.I.allReady();

  runApp(const GitHubDiscoverApp());
}
