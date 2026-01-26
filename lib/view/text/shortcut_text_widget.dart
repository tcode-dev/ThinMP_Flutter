// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/l10n/app_localizations.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class ShortcutTextWidget extends ConsumerWidget {
  final String id;
  final ShortcutConstant type;

  const ShortcutTextWidget({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return FutureBuilder<bool>(
      future: shortcutRepository.exists(id, type),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        final isShortcut = snapshot.data ?? false;
        return TextWidget(text: isShortcut ? localizations.shortcutRemove : localizations.shortcutAdd);
      },
    );
  }
}
