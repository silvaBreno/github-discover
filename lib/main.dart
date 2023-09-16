import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:github_discover/src/app.dart';
import 'package:github_discover/src/config/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await di.init();

  runApp(const GitHubDiscoverApp());
}
