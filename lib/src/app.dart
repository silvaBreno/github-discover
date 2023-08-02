import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/presentation/pages/home/home_page.dart';

class GitHubDiscoverApp extends StatelessWidget {
  const GitHubDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'GitHub Discover',
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: const HomePage(),
    );
  }
}
