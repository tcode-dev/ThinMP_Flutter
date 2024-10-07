import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
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
import 'package:thinmpf/view/text/text_widget.dart';

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

  void _load() {
    ref.read(playlistDetailProvider.notifier).fetchPlaylist(widget.id);
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
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final playlistDetail = ref.watch(playlistDetailProvider);
    final songs = ref.watch(songsProvider);
    final name = playlistDetail != null ? playlistDetail.name : '';
    final imageId = songs.isNotEmpty ? songs.first.imageId : '0';
    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: screenSize.width - top,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: TextWidget(text: name),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: ImageWidget(id: imageId, size: screenSize.width),
                      ),
                      Positioned(
                        top: screenSize.width - 200,
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
                      if (item == 'edit') {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlaylistDetailEditPageWidget(id: widget.id)),
                        );

                        _load();
                      } else if (item == 'shortcut') {
                        shortcutRepository.toggle(widget.id, ShortcutConstant.playlist);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(AppLocalizations.of(context)!.edit),
                      ),
                      PopupMenuItem(
                        value: 'shortcut',
                        child: ShortcutTextWidget(id: widget.id, type: ShortcutConstant.playlist),
                      ),
                    ],
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: StyleConstant.row.contentBoxHeight,
                  child: Center(
                    child: TextWidget(text: AppLocalizations.of(context)!.playlist),
                  ),
                ),
              ),
              SongListWidget(callback: _load, onTap: _play),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
