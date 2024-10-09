import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/text/favorite_artist_text_widget.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';
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
    final playerApi = ref.read(playerApiFactoryProvider);

    playerApi.startArtistSongs(index, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final albums = ref.watch(albumsProvider);
    final songs = ref.watch(songsProvider);
    final name = albums.isNotEmpty ? albums.first.artistName : '';
    final imageId = albums.isNotEmpty ? albums.first.imageId : '0';
    final description = '${albums.length} albums, ${songs.length} songs';
    final screenSize = MediaQuery.sizeOf(context);
    final mediaQuery = MediaQuery.of(context);
    final shortestSide = mediaQuery.size.shortestSide;
    final expandedHeight = shortestSide - mediaQuery.padding.top;

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
                  title: TextWidget(text: name),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Center(
                          child: Blur(
                            blur: 10,
                            blurColor: Theme.of(context).transparent,
                            child: ImageWidget(id: imageId, size: shortestSide, useFallbackImage: false),
                          ),
                        ),
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
                      Positioned(
                        child: Center(child: CircleImageWidget(id: imageId, size: shortestSide * 0.33)),
                      ),
                    ],
                  ),
                ),
                actions: [
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: shortcutLabel,
                        child: ShortcutTextWidget(id: widget.id, type: ShortcutConstant.artist),
                      ),
                      PopupMenuItem(
                        value: favoriteLabel,
                        child: FavoriteArtistTextWidget(artistId: widget.id),
                      ),
                    ],
                    onSelected: (value) async {
                      if (value == shortcutLabel) {
                        shortcutRepository.toggle(widget.id, ShortcutConstant.artist);
                      } else if (value == favoriteLabel) {
                        favoriteArtistRepository.toggle(widget.id);
                      }
                    },
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: StyleConstant.row.contentBoxHeight,
                  child: Center(
                    child: TextWidget(text: description),
                  ),
                ),
              ),
              SectionTitleWidget(title: localizations.albums),
              AlbumGridWidget(callback: _load),
              SectionTitleWidget(title: localizations.songs),
              SongListWidget(onTap: _play),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
