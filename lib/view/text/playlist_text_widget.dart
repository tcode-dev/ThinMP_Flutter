import 'package:flutter/material.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class PlaylistTextWidget extends StatelessWidget {
  const PlaylistTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return TextWidget(text: localizations.playlistAdd);
  }
}
