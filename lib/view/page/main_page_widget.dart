import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/main_provider.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/grid/shortcut_grid_widget.dart';
import 'package:thinmpf/view/list/navigation_list_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class MainPageWidget extends ConsumerStatefulWidget {
  const MainPageWidget({super.key});

  @override
  MainPageWidgetState createState() => MainPageWidgetState();
}

class MainPageWidgetState extends ConsumerState<MainPageWidget> {
  void _reload() {
    ref.read(mainProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(mainProvider);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: top, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.library, style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                  NavigationListWidget(callback: _reload),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.shortcut, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(StyleConstant.padding.large),
                    sliver: const ShortcutGridWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: StyleConstant.padding.large, left: StyleConstant.padding.large),
                      child: Text(AppLocalizations.of(context)!.recentlyAdded, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(StyleConstant.padding.large),
                    sliver: const AlbumsGridWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: EmptyRowWidget(),
                  ),
                ],
              );
            },
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
