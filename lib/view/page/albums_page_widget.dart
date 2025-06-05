import 'package:flutter/material.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/view/grid/album_grid_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class AlbumsPageWidget extends ConsumerStatefulWidget {
  const AlbumsPageWidget({super.key});

  @override
  AlbumsPageWidgetState createState() => AlbumsPageWidgetState();
}

class AlbumsPageWidgetState extends ConsumerState<AlbumsPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(albumsProvider.notifier).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(localizations.albums),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: StyleConstant.padding.large),
                sliver: AlbumGridWidget(callback: _load),
              ),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
