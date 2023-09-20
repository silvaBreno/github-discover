import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';
import 'package:github_discover/src/app.dart';
import 'package:github_discover/src/config/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  startModules();
  await GetIt.I.allReady();

  runApp(const GitHubDiscoverApp());
}
