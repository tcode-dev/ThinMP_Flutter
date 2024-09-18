import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/page/favorite_songs_provider.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/favorite_songs_edit_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_action_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class FavoriteSongsPageWidget extends ConsumerStatefulWidget {
  const FavoriteSongsPageWidget({super.key});

  @override
  FavoriteSongsPageWidgetState createState() => FavoriteSongsPageWidgetState();
}

class FavoriteSongsPageWidgetState extends ConsumerState<FavoriteSongsPageWidget> {
  void _reload() {
    ref.read(favoriteSongsProvider.notifier).reload();
  }

  void _play(int index, List<String?> ids) {
    _player.start(index, ids);
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(favoriteSongsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.favoriteSong),
        actions: [
          PopupMenuButton(
            onSelected: (item) async {
              if (item == 'edit') {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteSongsEditPageWidget()),
                );

                _reload();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text(AppLocalizations.of(context)!.edit),
              ),
            ],
          )
        ],
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
                      return MediaActionRowWidget(
                        song: vm.songs[index],
                        onTap: () => _play(index, vm.songIds),
                        onLongPress: _reload,
                      );
                    }, childCount: vm.songs.length),
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
