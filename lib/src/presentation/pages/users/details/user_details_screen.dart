import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/injection.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/blocs/users/details/user_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';
import 'package:go_router/go_router.dart';

class UserDetailsScreen extends StatefulWidget {
  final String? login;

  const UserDetailsScreen({
    super.key,
    required this.login,
  });

  @override
  State<UserDetailsScreen> createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  final UserDetailsBloc _bloc = getIt.get<UserDetailsBloc>();

  User? user;
  Repositories repositories = [];

  @override
  void initState() {
    super.initState();
    _bloc.add(UserDetailLoadedEvent(fullName: widget.login));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<UserDetailsBloc, UserDetailsState>(
        builder: (context, state) {
          if (state is UserDetailsLoading) {
            return const CustomLoader();
          }

          if (state is UserDetailsError) {
            return CustomEmptyState(
              iconPath: Asset.stopIcon,
              description: state.message ?? '',
            );
          }

          return UserDetailsPage(
            user: user,
            repositories: repositories,
            backButtonPressed: () {
              context.pushReplacementNamed(
                AppRoute.home.name,
                extra: 2,
              );
            },
          );
        },
        listener: (context, state) {
          if (state is UserDetailsSuccess) {
            user = state.user;
            repositories = state.repositories ?? [];
          }
        },
      ),
    );
  }
}
