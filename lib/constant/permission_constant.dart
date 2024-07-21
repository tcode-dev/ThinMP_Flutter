import 'package:permission_handler/permission_handler.dart';

Map<String, List<Permission>> permissionConstant = {
  'android': [Permission.audio, Permission.notification],
  'ios': [Permission.mediaLibrary],
};
