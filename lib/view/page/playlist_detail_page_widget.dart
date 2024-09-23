import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/provider/page/playlist_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

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
    final playerHostApi = ref.read(playerHostApiFactoryProvider);
    final songs = ref.read(songsProvider);
    final songIds = songs.map((song) => song.id).toList();

    playerHostApi.start(index, songIds);
  }

  @override
  Widget build(BuildContext context) {
    final playlistDetail = ref.watch(playlistDetailProvider);
    final songs = ref.watch(songsProvider);
    final imageId = songs.isNotEmpty ? songs.first.imageId : '';
    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;

    if (playlistDetail == null) {
      return const LoadingWidget();
    }

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
                  title: Text(playlistDetail.name),
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
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.playlist),
                  ),
                ),
              ),
              SongListWidget(onLongPress: _load, onTap: _play),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
