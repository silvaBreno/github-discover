import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_page.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:go_router/go_router.dart';

class RepositoriesSearchScreen extends StatefulWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  State<RepositoriesSearchScreen> createState() =>
      _RepositoriesSearchScreenState();
}

class _RepositoriesSearchScreenState extends State<RepositoriesSearchScreen> {
  final RepositoriesSearchBloc _bloc = getIt.get<RepositoriesSearchBloc>();

  Repositories repositories = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<RepositoriesSearchBloc, RepositoriesSearchState>(
        builder: (context, state) {
          if (state is RepositoriesSearchLoading) {
            return const CustomLoader();
          }

          if (state is RepositoriesSearchEmpty) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: context.locales.emptySearchResultText,
            );
          }

          if (state is RepositoriesSearchError) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: state.message ?? '',
            );
          }

          return RepositoriesSearchPage(
            repositories: repositories,
            onSearch: (searchText) {
              _bloc.add(SearchRepositoriesEvent(search: searchText));
            },
            onItemTap: (item) {
              context.goNamed(
                AppRoute.repositoryDetails.name,
                pathParameters: {'repository': item?.name ?? ''},
                extra: item?.fullName,
              );
            },
          );
        },
        listener: (context, state) {
          if (state is RepositoriesSearchSuccess) {
            repositories = state.repositories ?? [];
          }
        },
      ),
    );
  }
}
