import 'package:flutter/material.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/user_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class UsersSearchPage extends StatefulWidget {
  const UsersSearchPage({super.key});

  @override
  State<UsersSearchPage> createState() => _UsersSearchPageState();
}

class _UsersSearchPageState extends State<UsersSearchPage> {
  var formatter = NumberFormat.compact(locale: locale);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        bottom: CustomAppBarBottom(
          onChanged: (search) {},
          onPressed: () {},
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
                CustomText(
                  text: context.locales.resultHeader(formatter.format(3)),
                  textAlign: TextAlign.start,
                  style: TypographyType.header,
                ),
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
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Flexible(
                        child: UserListTile(
                          user: kUserMock,
                          onTap: () {
                            context.goNamed(AppRoute.userDetails.name);
                          },
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
