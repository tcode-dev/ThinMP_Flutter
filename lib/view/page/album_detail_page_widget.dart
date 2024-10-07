import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/page/album_detail_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/text/shortcut_text_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class AlbumDetailPageWidget extends ConsumerStatefulWidget {
  final String id;

  const AlbumDetailPageWidget({super.key, required this.id});

  @override
  AlbumDetailPageWidgetState createState() => AlbumDetailPageWidgetState();
}

class AlbumDetailPageWidgetState extends ConsumerState<AlbumDetailPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(songsProvider.notifier).fetchAlbumSongs(widget.id);
    ref.read(albumDetailProvider.notifier).fetchAlbumDetail(widget.id);
  }

  void _play(int index) {
    final playerApi = ref.read(playerApiFactoryProvider);

    playerApi.startAlbumSongs(index, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final albumDetail = ref.watch(albumDetailProvider);
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
                  title: TextWidget(text: albumDetail?.name ?? ''),
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: ImageWidget(id: albumDetail?.imageId ?? '0', size: screenSize.width),
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
                      if (item == shortcutLabel) {
                        shortcutRepository.toggle(widget.id, ShortcutConstant.album);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: shortcutLabel,
                        child: ShortcutTextWidget(id: widget.id, type: ShortcutConstant.album),
                      ),
                    ],
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: StyleConstant.row.contentBoxHeight,
                  child: Center(
                    child: TextWidget(text: albumDetail?.artistName ?? ''),
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
