import 'package:permission_handler/permission_handler.dart';

Map<String, List<Permission>> permissionConstant = {
  'android': [Permission.mediaLibrary, Permission.notification],
  'ios': [Permission.mediaLibrary],
};
