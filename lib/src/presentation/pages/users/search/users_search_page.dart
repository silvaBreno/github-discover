import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/user_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class UsersSearchPage extends StatefulWidget {
  final Users users;
  final void Function(String?) onSearch;
  final void Function(User?) onItemTap;

  const UsersSearchPage({
    super.key,
    required this.users,
    required this.onSearch,
    required this.onItemTap,
  });

  @override
  State<UsersSearchPage> createState() => _UsersSearchPageState();
}

class _UsersSearchPageState extends State<UsersSearchPage> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: locale);

    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        bottom: CustomAppBarBottom(
          onChanged: (search) {
            setState(() {
              searchText = search;
            });
          },
          onPressed: () => widget.onSearch(searchText),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.users.isNotEmpty
                    ? CustomText(
                        text: context.locales.resultHeader(
                            formatter.format(widget.users.length)),
                        textAlign: TextAlign.start,
                        style: TypographyType.header,
                      )
                    : const SizedBox(),
                const SizedBox(height: Spacing.s32),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 320,
                      mainAxisSpacing: Spacing.s8,
                      crossAxisSpacing: Spacing.s8,
                    ),
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.users.length,
                    itemBuilder: (context, index) {
                      final item = widget.users[index];
                      return Flexible(
                        child: UserListTile(
                          user: item,
                          onTap: () => widget.onItemTap(item),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
