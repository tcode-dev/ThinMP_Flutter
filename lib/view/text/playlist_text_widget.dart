import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class PlaylistTextWidget extends StatelessWidget {
  const PlaylistTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return TextWidget(text: localizations.playlistAdd);
  }
}
