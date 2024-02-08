import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/pigeon_output/permission.g.dart';

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
    final api = HostPermissionApi();
    await api.requestPermission();
//   var status = await Permission.mediaLibrary.request();
//   print(status);
//     print(status.isDenied);
//   if (status.isDenied) {
//     print("isDenied.");
//   // We haven't asked for permission yet or the permission has been denied before, but not permanently.
// }
  // if (status.isGranted) {
  //   print("Granted.");
  // } else if (status.isPermanentlyDenied) {
  //   openAppSettings();
  // } else {
  //   status = await Permission.mediaLibrary.request();
  //   if (status.isGranted) {
  //     print("Granted.");
  //   } else {
  //     openAppSettings();
  //   }
  // }
  // return await Permission.mediaLibrary.request();
});
