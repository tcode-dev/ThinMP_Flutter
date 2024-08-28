import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/main_provider.dart';
import 'package:thinmpf/util/calc_child_aspect_ratio.dart';
import 'package:thinmpf/util/calc_cross_axis_count.dart';
import 'package:thinmpf/view/cell/album_cell_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/album_detail_page_widget.dart';
import 'package:thinmpf/view/page/albums_page_widget.dart';
import 'package:thinmpf/view/page/artists_page_widget.dart';
import 'package:thinmpf/view/page/songs_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/plain_row_widget.dart';

class PageInfo {
  final String text;
  final Widget Function() widgetBuilder;

  PageInfo({required this.text, required this.widgetBuilder});
}

final List<PageInfo> pageList = [
  PageInfo(text: "Artists", widgetBuilder: () => const ArtistsPageWidget()),
  PageInfo(text: "Albums", widgetBuilder: () => const AlbumsPageWidget()),
  PageInfo(text: "Songs", widgetBuilder: () => const SongsPageWidget()),
];

class MainPageWidget extends ConsumerWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(mainProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final crossAxisCount = calcCrossAxisCount(screenSize.width);
    final childAspectRatio = calcChildAspectRatio(screenSize.width, crossAxisCount);
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
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(top: top, left: 20),
                      child: Text(AppLocalizations.of(context)!.library, style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 51,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pageList[index].widgetBuilder()),
                          );
                        },
                        child: PlainRowWidget(title: pageList[index].text),
                      );
                    }, childCount: pageList.length),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(AppLocalizations.of(context)!.recentlyAdded, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(styleConstant[StyleType.padding][SizeConstant.large]),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: childAspectRatio,
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
                        mainAxisSpacing: styleConstant[StyleType.padding][SizeConstant.large],
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final album = vm?.albums[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AlbumDetailPageWidget(id: album!.id)),
                              );
                            },
                            child: AlbumCellWidget(album: vm!.albums[index]),
                          );
                        },
                        childCount: vm?.albums.length,
                      ),
                    ),
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
