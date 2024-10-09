import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/constant/permission_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
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
    final localizations = AppLocalizations.of(context)!;

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
                  padding: EdgeInsets.only(right: StyleConstant.padding.large, bottom: StyleConstant.row.contentBoxHeight, left: StyleConstant.button.large),
                  child: Text(localizations.permissionDenied),
                ),
                ElevatedButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: Text(localizations.openAppSettings),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
