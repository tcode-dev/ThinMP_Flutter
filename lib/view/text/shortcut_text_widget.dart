import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class ShortcutTextWidget extends ConsumerWidget {
  final String id;
  final ShortcutConstant type;

  const ShortcutTextWidget({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);

    return TextWidget(text: shortcutRepository.exists(id, type) ? AppLocalizations.of(context)!.shortcutRemove : AppLocalizations.of(context)!.shortcutAdd);
  }
}
