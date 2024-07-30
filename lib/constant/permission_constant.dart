import 'package:permission_handler/permission_handler.dart';
import 'package:thinmpf/constant/platform_constant.dart';

const Map<PlatformConstant, List<Permission>> permissionConstant = {
  PlatformConstant.android: [Permission.audio, Permission.notification],
  PlatformConstant.ios: [Permission.mediaLibrary],
};
