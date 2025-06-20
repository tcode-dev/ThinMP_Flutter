// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/config/player_config_factory_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/provider/player/playback_error_provider.dart';
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

  void _play(int index) async {
    final playerApi = ref.read(playerApiFactoryProvider);
    final playerConfig = ref.read(playerConfigFactoryProvider);
    final repeat = await playerConfig.loadRepeat();
    final shuffle = await playerConfig.loadShuffle();

    playerApi.startAllSongs(index, repeat, shuffle);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    ref.listen(playbackErrorProvider, (_, __) {
      _load();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(localizations.songs),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
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
