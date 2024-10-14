import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/page/playlist_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/page/playlist_detail_edit_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';
import 'package:thinmpf/view/title/collapsing_primary_title_widget.dart';
import 'package:thinmpf/view/title/collapsing_secondary_title_widget.dart';

class PlaylistDetailPageWidget extends ConsumerStatefulWidget {
  final String id;

  const PlaylistDetailPageWidget({super.key, required this.id});

  @override
  PlaylistDetailPageWidgetState createState() => PlaylistDetailPageWidgetState();
}

class PlaylistDetailPageWidgetState extends ConsumerState<PlaylistDetailPageWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  void _load() async {
    ref.read(songsProvider.notifier).fetchPlaylistSongs(widget.id);
  }

  void _reload() async {
    ref.read(playlistDetailProvider(widget.id).notifier).refetch(widget.id);
    ref.read(songsProvider.notifier).fetchPlaylistSongs(widget.id);
  }

  void _play(int index) {
    final playerApi = ref.read(playerApiFactoryProvider);
    final songs = ref.read(songsProvider);
    final songIds = songs.map((song) => song.id).toList();

    playerApi.start(index, songIds);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final playlistDetail = ref.watch(playlistDetailProvider(widget.id));
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final songs = ref.watch(songsProvider);
    final name = playlistDetail != null ? playlistDetail.name : '';
    final imageId = songs.isNotEmpty ? songs.first.imageId : '0';
    final screenSize = MediaQuery.sizeOf(context);
    final mediaQuery = MediaQuery.of(context);
    final shortestSide = mediaQuery.size.shortestSide;
    final expandedHeight = shortestSide - mediaQuery.padding.top;
    if (playlistDetail == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: expandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: CollapsingPrimaryTitleWidget(title: name),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Center(child: ImageWidget(id: imageId, size: shortestSide)),
                      ),
                      Positioned(
                        top: shortestSide - 200,
                        width: screenSize.width,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context).transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  PopupMenuButton(
                    onSelected: (item) async {
                      if (item == editLabel) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlaylistDetailEditPageWidget(id: widget.id)),
                        );

                        _reload();
                      } else if (item == shortcutLabel) {
                        shortcutRepository.toggle(widget.id, ShortcutConstant.playlist);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: editLabel,
                        child: Text(localizations.edit),
                      ),
                      PopupMenuItem(
                        value: shortcutLabel,
                        child: ShortcutTextWidget(id: widget.id, type: ShortcutConstant.playlist),
                      ),
                    ],
                  )
                ],
              ),
              CollapsingSecondaryTitleWidget(title: localizations.playlist),
              SongListWidget(callback: _reload, onTap: _play),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
