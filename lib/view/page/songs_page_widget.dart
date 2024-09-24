import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/api/player_host_api_factory_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/view/list/song_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class SongsPageWidget extends ConsumerStatefulWidget {
  const SongsPageWidget({super.key});

  @override
  SongsPageWidgetState createState() => SongsPageWidgetState();
}

class SongsPageWidgetState extends ConsumerState<SongsPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(songsProvider.notifier).fetchAllSongs();
  }

  void _play(int index) {
    final playerHostApi = ref.read(playerHostApiFactoryProvider);

    playerHostApi.startAllSongs(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.songs),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
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
