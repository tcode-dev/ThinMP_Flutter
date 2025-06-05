// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/list/artist_list_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class ArtistsPageWidget extends ConsumerStatefulWidget {
  const ArtistsPageWidget({super.key});

  @override
  ArtistsPageWidgetState createState() => ArtistsPageWidgetState();
}

class ArtistsPageWidgetState extends ConsumerState<ArtistsPageWidget> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    ref.read(artistsProvider.notifier).fetchAllArtists();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(localizations.artists),
      ),
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            ArtistListWidget(callback: _load),
            const EmptyRowWidget(),
          ],
        ),
        const MiniPlayerWidget(),
      ]),
    );
  }
}
