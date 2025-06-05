import 'package:flutter/material.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/provider/repository/favorite_song_repository_factory_provider.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class FavoriteSongTextWidget extends ConsumerWidget {
  final String songId;

  const FavoriteSongTextWidget({super.key, required this.songId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final favoriteSongRepository = ref.watch(favoriteSongRepositoryFactoryProvider);

    return TextWidget(text: favoriteSongRepository.exists(songId) ? localizations.favoriteRemove : localizations.favoriteAdd);
  }
}
