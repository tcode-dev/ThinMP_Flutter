import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/page/playlists_provider.dart';
import 'package:thinmpf/view/list/playlist_list_widget.dart';
import 'package:thinmpf/view/page/playlists_edit_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class PlaylistsPageWidget extends ConsumerStatefulWidget {
  const PlaylistsPageWidget({super.key});

  @override
  PlaylistsPageWidgetState createState() => PlaylistsPageWidgetState();
}

class PlaylistsPageWidgetState extends ConsumerState<PlaylistsPageWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  void _load() {
    ref.read(playlistsProvider.notifier).fetchPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.playlists),
        actions: [
          PopupMenuButton(
            onSelected: (item) async {
              if (item == 'edit') {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlaylistsEditPageWidget()),
                );

                _load();
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
          CustomScrollView(
            slivers: [
              PlaylistListWidget(callback: _load),
              const EmptyRowWidget(),
            ],
          ),
          const MiniPlayerWidget(),
        ],
      ),
    );
  }
}
