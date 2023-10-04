import 'package:github_discover/src/presentation/pages/home/home_page.dart';
import 'package:github_discover/src/presentation/pages/profile/profile/profile_screen.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_screen.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_screen.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_screen.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  profile,
  repositoriesSearch,
  repositoryDetails,
  usersSearch,
  userDetails,
}

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) {
        return HomePage(
          index: state.extra as int? ?? 0,
        );
      },
      routes: [
        GoRoute(
          path: 'profile',
          name: AppRoute.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: 'repositories',
          name: AppRoute.repositoriesSearch.name,
          builder: (context, state) => const RepositoriesSearchScreen(),
          routes: [
            GoRoute(
              path: ':repository',
              name: AppRoute.repositoryDetails.name,
              builder: (context, state) {
                return RepositoryDetailsScreen(
                  fullName: state.extra as String?,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'users',
          name: AppRoute.usersSearch.name,
          builder: (context, state) => const UsersSearchScreen(),
          routes: [
            GoRoute(
              path: ':user',
              name: AppRoute.userDetails.name,
              builder: (context, state) {
                return UserDetailsScreen(
                  login: state.extra as String?,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
