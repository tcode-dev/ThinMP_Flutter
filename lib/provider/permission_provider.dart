import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

// final permissionProvider = StateNotifierProvider<PermissionState, PermissionStatus>((ref) => PermissionState());

// class PermissionState extends StateNotifier<PermissionStatus> {
//   PermissionState() : super(PermissionStatus.denied) {
//     requestPermission();
//   }

//   Future<void> requestPermission() async {
//     PermissionStatus status = await Permission.mediaLibrary.request();
//     state = status;
//   }
// }

final permissionProvider = FutureProvider((ref) async {
  print("permissionProvider.");
      if (await Permission.mediaLibrary.isGranted) {
      print("Granted.");
    } else if (await Permission.mediaLibrary.isPermanentlyDenied) {
      openAppSettings();
    } else {
      var status = await Permission.mediaLibrary.request();
      if (status.isGranted) {
        print("Granted.");
      } else {
        openAppSettings();
      }
    }
  return await Permission.mediaLibrary.request();
});