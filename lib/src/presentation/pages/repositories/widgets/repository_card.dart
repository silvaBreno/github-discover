import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/avatar.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_item.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class RepositoryCard extends StatelessWidget {
  final Repository repository;

  const RepositoryCard({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderCard(context.colors.kBackgrounSubtleColor),
      padding: const EdgeInsets.all(Spacing.s24),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            avatarUrl: repository.owner?.avatarUrl,
            radius: Spacing.s72,
          ),
          const SizedBox(height: Spacing.s24),
          RepositoryItem(
            label: context.locales.repositoryLabel,
            text: repository.name,
          ),
          const SizedBox(height: Spacing.s16),
          RepositoryItem(
            label: context.locales.ownerLabel,
            text: repository.owner?.login,
          ),
          const SizedBox(height: Spacing.s16),
          RepositoryItem(
            label: context.locales.descriptionLabel,
            text: repository.description,
          ),
          const SizedBox(height: Spacing.s16),
          RepositoryItem(
            label: context.locales.licenseLabel,
            text: repository.license?.name,
          ),
          const SizedBox(height: Spacing.s16),
          RepositoryItem(
            label: context.locales.visibilityLabel,
            text: repository.visibility,
          ),
        ],
      ),
    );
  }
}
