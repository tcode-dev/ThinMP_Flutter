import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/title/section_title_widget.dart';

class ArtistDetailPageWidget extends ConsumerStatefulWidget {
  final String id;

  const ArtistDetailPageWidget({super.key, required this.id});

  @override
  ArtistDetailPageWidgetState createState() => ArtistDetailPageWidgetState();
}

class ArtistDetailPageWidgetState extends ConsumerState<ArtistDetailPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(albumsProvider.notifier).fetchArtistAlbums(widget.id);
    ref.read(songsProvider.notifier).fetchArtistSongs(widget.id);
  }

  void _play(int index) {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    playerHostApi.startArtistSongs(index, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(albumsProvider);
    final songs = ref.watch(songsProvider);
    final name = albums.isNotEmpty ? albums.first.artistName : '';
    final imageId = albums.isNotEmpty ? albums.first.imageId : '0';
    final description = '${albums.length} albums, ${songs.length} songs';
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
                  title: Text(name),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Blur(
                          blur: 10,
                          blurColor: Theme.of(context).transparent,
                          child: ImageWidget(id: imageId, size: screenSize.width),
                        ),
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
                      Positioned(
                        child: Center(child: CircleImageWidget(id: imageId, size: screenSize.width * 0.33)),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(description),
                  ),
                ),
              ),
              SectionTitleWidget(title: AppLocalizations.of(context)!.albums),
              AlbumGridWidget(callback: _load),
              SectionTitleWidget(title: AppLocalizations.of(context)!.songs),
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
