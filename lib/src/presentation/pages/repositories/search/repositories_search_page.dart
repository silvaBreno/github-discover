import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class RepositoriesSearchPage extends StatefulWidget {
  final Repositories repositories;
  final void Function(String?) onSearch;
  final void Function(Repository?) onItemTap;

  const RepositoriesSearchPage({
    super.key,
    required this.repositories,
    required this.onSearch,
    required this.onItemTap,
  });

  @override
  State<RepositoriesSearchPage> createState() => _RepositoriesSearchPageState();
}

class _RepositoriesSearchPageState extends State<RepositoriesSearchPage> {
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
                widget.repositories.isNotEmpty
                    ? CustomText(
                        text: context.locales.resultHeader(
                            formatter.format(widget.repositories.length)),
                        textAlign: TextAlign.start,
                        style: TypographyType.header,
                      )
                    : const SizedBox(),
                const SizedBox(height: Spacing.s32),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.repositories.length,
                  itemBuilder: (context, index) {
                    final item = widget.repositories[index];
                    return RepositoryListTile(
                      repository: item,
                      onTap: () => widget.onItemTap(item),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
