import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/artist_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/image/circle_image_widget.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/title/section_title_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

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

  Future<void> _load() async {
    await ref.read(artistDetailProvider.notifier).fetchArtistDetail(widget.id);
  }

  void _play(int index) {
    _player.startArtistSongs(index, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final artistDetail = ref.watch(artistDetailProvider);

    if (artistDetail == null) {
      return const LoadingWidget();
    }

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
                  title: Text(artistDetail.name),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Blur(
                          blur: 10,
                          blurColor: Theme.of(context).transparent,
                          child: ImageWidget(id: artistDetail.imageId, size: screenSize.width),
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
                        child: Center(child: CircleImageWidget(id: artistDetail.imageId, size: screenSize.width * 0.33)),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(artistDetail.description),
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
