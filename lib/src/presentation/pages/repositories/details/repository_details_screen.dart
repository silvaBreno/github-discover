import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';
import 'package:go_router/go_router.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  final String? fullName;

  const RepositoryDetailsScreen({
    super.key,
    this.fullName,
  });

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  final RepositoryDetailsBloc _bloc = getIt.get<RepositoryDetailsBloc>();

  Repository? repository;

  @override
  void initState() {
    super.initState();
    _bloc.add(RepositoryDetailLoadedEvent(fullName: widget.fullName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<RepositoryDetailsBloc, RepositoryDetailsState>(
        builder: (context, state) {
          if (state is RepositoryDetailsLoading) {
            return const CustomLoader();
          }

          if (state is RepositoryDetailsError) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: state.message ?? '',
            );
          }

          return RepositoryDetailsPage(
            repository: repository,
            backButtonPressed: () {
              context.pushReplacementNamed(
                AppRoute.home.name,
                extra: 1,
              );
            },
          );
        },
        listener: (context, state) {
          if (state is RepositoryDetailsSuccess) {
            repository = state.repository;
          }
        },
      ),
    );
  }
}
