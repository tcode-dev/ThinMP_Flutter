import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/playlist_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/playlist_action_row_widget.dart';

class PlaylistsPageWidget extends ConsumerStatefulWidget {
  const PlaylistsPageWidget({super.key});

  @override
  PlaylistsPageWidgetState createState() => PlaylistsPageWidgetState();
}

class PlaylistsPageWidgetState extends ConsumerState<PlaylistsPageWidget> {
  void _reload() {
    ref.read(playlistsProvider.notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(playlistsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.playlists),
      ),
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
                  SliverFixedExtentList(
                    itemExtent: StyleConstant.row.borderBoxHeight,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      final playlist = vm.playlists[index];

                      return GestureDetector(
                        child: PlaylistActionRowWidget(
                          playlist: playlist,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PlaylistDetailPageWidget(id: playlist.id)),
                            );
                          },
                          onLongPress: _reload,
                        ),
                      );
                    }, childCount: vm.playlists.length),
                  ),
                  const EmptyRowWidget(),
                ],
              );
            },
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
