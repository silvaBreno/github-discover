import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';

class GitHubDiscoverApp extends StatelessWidget {
  const GitHubDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.locales.appTitle,
      routerConfig: router,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
