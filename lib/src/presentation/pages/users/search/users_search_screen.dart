import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/blocs/users/search/users_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_page.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:go_router/go_router.dart';

class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({super.key});

  @override
  State<UsersSearchScreen> createState() => UsersSearchScreenState();
}

class UsersSearchScreenState extends State<UsersSearchScreen> {
  final UsersSearchBloc _bloc = getIt.get<UsersSearchBloc>();

  Users users = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<UsersSearchBloc, UsersSearchState>(
        builder: (context, state) {
          if (state is UsersSearchLoading) {
            return const CustomLoader();
          }

          if (state is UsersSearchEmpty) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: context.locales.emptySearchResultText,
            );
          }

          if (state is UsersSearchError) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: state.message ?? '',
            );
          }

          return UsersSearchPage(
            users: users,
            onSearch: (searchText) {
              _bloc.add(SearchUsersEvent(search: searchText));
            },
            onItemTap: (item) {
              context.goNamed(
                AppRoute.userDetails.name,
                pathParameters: {'user': item?.login ?? ''},
                extra: item?.login,
              );
            },
          );
        },
        listener: (context, state) {
          if (state is UsersSearchSuccess) {
            users = state.users ?? [];
          }
        },
      ),
    );
  }
}
