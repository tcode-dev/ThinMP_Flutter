import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Future<PermissionStatus> _permission() async {
    final status = await Permission.mediaLibrary
   .onDeniedCallback(() {
    print( 'onDeniedCallback');
  })
  .onGrantedCallback(() {
    print( 'onGrantedCallback');
  })
  .onPermanentlyDeniedCallback(() {
    print( 'onPermanentlyDeniedCallback');
  })
  // .onRestrictedCallback(() {
  //   print( Permission.mediaLibrary.status);
  // })
  // .onLimitedCallback(() {
  //   print( Permission.mediaLibrary.status);
  // })
  // .onProvisionalCallback(() {
  //   print( Permission.mediaLibrary.status);
  // })
  .request();
// print(status);
  return status;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PermissionStatus>(
      future: _permission(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return Container();
        }
        if (snapshot.data!.isGranted) {
          return widget.child;
        }
        return Container();
      },
    );
  }
}