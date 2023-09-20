import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/home/widgets/bottom_navigation.dart';
import 'package:github_discover/src/presentation/pages/profile/profile/profile_screen.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_screen.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_screen.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class HomePage extends StatefulWidget {
  final bool loading;

  const HomePage({
    super.key,
    required this.loading,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const ProfileScreen(),
    const RepositoriesSearchScreen(),
    const UsersSearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      body: SafeArea(
        child: Stack(
          children: [
            widget.loading
                ? const CustomLoader()
                : Container(child: _pages.elementAt(_pageIndex))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          bottomNavigationItem(
            context: context,
            iconPath: Asset.mortarBoardIcon,
            label: context.locales.profileNavigationItem,
          ),
          bottomNavigationItem(
            context: context,
            iconPath: Asset.repoIcon,
            label: context.locales.repoSearchNavigationItem,
          ),
          bottomNavigationItem(
            context: context,
            iconPath: Asset.peopleIcon,
            label: context.locales.userSearchNavigationItem,
          ),
        ],
        currentPage: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationItem({
    required BuildContext context,
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: CustomIcon(
        iconPath: iconPath,
        color: context.colors.kForegroundColor,
      ),
      activeIcon: CustomIcon(
        iconPath: iconPath,
        color: context.colors.kAccentColor,
      ),
      label: label,
    );
  }
}
