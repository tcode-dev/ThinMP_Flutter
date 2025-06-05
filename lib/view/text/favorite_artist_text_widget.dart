// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class FavoriteArtistTextWidget extends ConsumerWidget {
  final String artistId;

  const FavoriteArtistTextWidget({super.key, required this.artistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);

    return TextWidget(text: favoriteArtistRepository.exists(artistId) ? localizations.favoriteRemove : localizations.favoriteAdd);
  }
}
