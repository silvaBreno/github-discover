import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_card.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class RepositoryDetailsPage extends StatelessWidget {
  const RepositoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Repository repository = kRepositoryMock;

    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        text: repository.name?.toUpperCase(),
        hasBackButton: true,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Spacing.s24),
          width: MediaQuery.sizeOf(context).width,
          child: RepositoryCard(repository: repository),
        ),
      ),
    );
  }
}
