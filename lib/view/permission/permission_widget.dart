import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/constant/permission_constant.dart';
import 'package:thinmpf/util/platform_select.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';

class PermissionWidget extends StatefulWidget {
  final Widget child;

  const PermissionWidget({
    super.key,
    required this.child,
  });

  @override
  State<PermissionWidget> createState() => _PermissionWidgetState();
}

class _PermissionWidgetState extends State<PermissionWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<Permission, PermissionStatus>>(
      future: platformSelect(permissionConstant).request(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const Scaffold(
            body: LoadingWidget(),
          );
        }
        if (snapshot.data!.values.every((status) => status.isGranted)) {
          return widget.child;
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 50.0, left: 20.0),
                  child: Text(AppLocalizations.of(context)!.permissionDenied),
                ),
                ElevatedButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: Text(AppLocalizations.of(context)!.openAppSettings),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
