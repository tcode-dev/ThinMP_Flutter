import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/constant/permission_constant.dart';
import 'package:thinmpf/util/platform_select.dart';
import 'package:thinmpf/view/text/text_widget.dart';

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
          return Container();
        }
        if (snapshot.data!.values.every((status) => status.isGranted)) {
          return widget.child;
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20.0, bottom: 50.0, left: 20.0),
                  child: TextWidget(text: "Permission has been denied. You can enable the permission in system settings."),
                ),
                ElevatedButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: const Text('open app settings'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
