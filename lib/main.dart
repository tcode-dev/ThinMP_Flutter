import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/api/player_flutter_api_impl.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/util/device_util.dart';
import 'package:thinmpf/view/page/main_page_widget.dart';
import 'package:thinmpf/view/permission/permission_widget.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    PlayerFlutterApi.setUp(PlayerFlutterApiImpl(ref));
  }

  @override
  Widget build(BuildContext context) {
    setOrientation(context);

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      home: const PermissionWidget(child: MainPageWidget()),
    );
  }
}
