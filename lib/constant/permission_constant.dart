import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/constant/target_platform_constant.dart';

Map<TargetPlatform, List<Permission>> permissionConstant = {
  TargetPlatform.android: [Permission.audio, Permission.notification],
  TargetPlatform.ios: [Permission.mediaLibrary],
};
