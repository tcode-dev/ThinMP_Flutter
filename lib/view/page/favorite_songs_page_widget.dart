import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/page/favorite_songs_provider.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/menu/song_context_menu.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class FavoriteSongsPageWidget extends ConsumerWidget {
  const FavoriteSongsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(favoriteSongsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.favoriteSongs),
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
                      return GestureDetector(
                        onTap: () {
                          _player.startAllSongs(index);
                        },
                        child: SongContextMenuWidget(child: MediaRowWidget(song: vm.songs[index])),
                      );
                    }, childCount: vm.songs.length),
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