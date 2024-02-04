import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/provider/permission_provider.dart';
import 'package:thinmpf/view/songs_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageView extends ConsumerWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(permissionProvider).value?? PermissionStatus.denied;

    return Scaffold(
      body: Center(
        child: status.isGranted
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SongsPageView()),
                  );
                },
                child: const Text('songs'),
              )
            : const Text('パーミッションが拒否されました'),
      ),
    );
  }
}
