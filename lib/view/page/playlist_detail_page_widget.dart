import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/page/playlist_detail_provider.dart';
import 'package:thinmpf/theme/custom_theme_data.dart';
import 'package:thinmpf/view/image/image_widget.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';
import 'package:thinmpf/view/row/media_action_row_widget.dart';

final PlayerHostApi _player = PlayerHostApi();

class PlaylistDetailPageWidget extends ConsumerStatefulWidget {
  final String id;

  const PlaylistDetailPageWidget({super.key, required this.id});

  @override
  PlaylistDetailPageWidgetState createState() => PlaylistDetailPageWidgetState();
}

class PlaylistDetailPageWidgetState extends ConsumerState<PlaylistDetailPageWidget> {
  void _reload() {
    ref.read(playlistDetailProvider(widget.id).notifier).reload(widget.id);
  }

  void _play(int index, List<String?> ids) {
    _player.start(index, ids);
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(playlistDetailProvider(widget.id));
    final screenSize = MediaQuery.sizeOf(context);
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              if (vm == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });
                return const LoadingWidget();
              }
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: screenSize.width - top,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(vm.name),
                      background: Stack(
                        children: [
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: ImageWidget(id: vm.imageId, size: screenSize.width),
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
